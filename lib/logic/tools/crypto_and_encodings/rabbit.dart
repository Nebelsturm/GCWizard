import 'dart:convert';
import 'dart:core';
import 'dart:core';
import 'dart:ffi';
import 'dart:math';
import 'dart:typed_data';
import 'dart:typed_data';

import 'package:gc_wizard/logic/common/units/unit.dart';

const int _blockSize = 128;
const int _keySize = 128;
const int _ivSize = 64;

class Rabbit {

_context1 _master = new _context1();
_context1 _working; // this is created on class construction/initialization

bool _initialized = false;

Rabbit(Uint8List key, Uint8List iv) {
  if (key != null && key.length != 16)
    // If Key is not NULL, then Key MUST be 16 bytes in length!
    return;
  _keySetup(key);
  _initialized = true;
  _reSeedIV(iv); // use the public method to validate the array
}


void _reSeedIV(Uint8List iv) {
  if (!_initialized)
    // Cannot set IV if object not initialized! Call Initialize(x[,x]) first!
    return null;
  if (iv != null && iv.length != 8)
    // If IV is not NULL, then IV MUST be 8 bytes in length!
    return null;
  if (iv == null) {
    _working = _master.clone(true); // assume a blank reset to master
    return;
  }
  _ivSetup(iv);
}

Uint8List keyStreamBytes(int length) {
  if (!_initialized)
    // Cannot get KeyStream if object not initialized! Call Initialize(x[,x]) first!
    return null;
  if (length < 1)
    // Length must be an integer greater than 1.");
    return null;

  /* Temporary variables */
  var buffer = Uint32List(4);
  var output = Uint8List(length);
  int outputPointer = 0;

  /* Generate full blocks and fill output (partial block at the end as needed) */
  while (length > 0) {
    /* Iterate the system */
    _nextState(_working);

    /* Generate 16 bytes of pseudo-random data */
    buffer[0] = (_working.state[0] ^ (_working.state[5] >> 16) ^ _uint32(_working.state[3] << 16));
    buffer[1] = (_working.state[2] ^ (_working.state[7] >> 16) ^ _uint32(_working.state[5] << 16));
    buffer[2] = (_working.state[4] ^ (_working.state[1] >> 16) ^ _uint32(_working.state[7] << 16));
    buffer[3] = (_working.state[6] ^ (_working.state[3] >> 16) ^ _uint32(_working.state[1] << 16));
    output.setRange(outputPointer, outputPointer + min(16, length),  _fromUInt32ToBytes(buffer)); //Uint32 to Bytes

    /* Increment output and Decrement length */
    outputPointer += 16;
    length -= 16;
  }

  return output;
}

int _uint32(int value) {
  return value & 0xFFFFFFFF;
}

int _rotateLeft(int x, int count) {
  return (x << count) | (x >> (32 - count));
}

int _fromBytesToUInt32(Uint8List list, int offset) {
  return ByteData.sublistView(list, offset, offset+4).getUint32(0, Endian.little);
}

Uint8List _fromUInt32ToBytes(Uint32List list) {
  return list.buffer.asUint8List();
}

/* G Function:  Square a 32-bit unsigned integer to obtain the 64-bit result and return */
/* the upper 32 bits XOR the lower 32 bits */
int _g(int x) {
  /* Temporary variables */
  int a, b, h, l;

  /* Construct high and low argument for squaring */
  a = x & 0xFFFF;
  b = x >> 16;

  /* Calculate high and low result of squaring */
  h = ((((a * a) >> 17) + (a * b)) >> 15) + (b * b);
  l = _uint32(x * x);

  /* Return high XOR low */
  return h ^ l;
}

/* Calculate the next internal state */
void _nextState(_context1 ctx) {
  /* Temporary variables */
  var g = Uint32List(8);
  var c_old = Uint32List(8);
  int i;

  /* Save old counter values */
  for (i = 0; i < 8; i++)
    c_old[i] = ctx.counters[i];

  /* Calculate new counter values */
  ctx.counters[0] = _uint32(ctx.counters[0] + 0x4D34D34D + ctx.carry);
  ctx.counters[1] = _uint32(ctx.counters[1] + 0xD34D34D3 + (ctx.counters[0] < c_old[0] ? 1 : 0));
  ctx.counters[2] = _uint32(ctx.counters[2] + 0x34D34D34 + (ctx.counters[1] < c_old[1] ? 1 : 0));
  ctx.counters[3] = _uint32(ctx.counters[3] + 0x4D34D34D + (ctx.counters[2] < c_old[2] ? 1 : 0));
  ctx.counters[4] = _uint32(ctx.counters[4] + 0xD34D34D3 + (ctx.counters[3] < c_old[3] ? 1 : 0));
  ctx.counters[5] = _uint32(ctx.counters[5] + 0x34D34D34 + (ctx.counters[4] < c_old[4] ? 1 : 0));
  ctx.counters[6] = _uint32(ctx.counters[6] + 0x4D34D34D + (ctx.counters[5] < c_old[5] ? 1 : 0));
  ctx.counters[7] = _uint32(ctx.counters[7] + 0xD34D34D3 + (ctx.counters[6] < c_old[6] ? 1 : 0));
  ctx.carry = (ctx.counters[7] < c_old[7] ? 1 : 0);

  /* Calculate the g-values */
  for (i = 0; i < 8; i++)
    g[i] = _g(_uint32(ctx.state[i] + ctx.counters[i]));

  /* Calculate new state values */
  ctx.state[0] = _uint32(g[0] + _rotateLeft(g[7], 16) + _rotateLeft(g[6], 16));
  ctx.state[1] = _uint32(g[1] + _rotateLeft(g[0], 8) + g[7]);
  ctx.state[2] = _uint32(g[2] + _rotateLeft(g[1], 16) + _rotateLeft(g[0], 16));
  ctx.state[3] = _uint32(g[3] + _rotateLeft(g[2], 8) + g[1]);
  ctx.state[4] = _uint32(g[4] + _rotateLeft(g[3], 16) + _rotateLeft(g[2], 16));
  ctx.state[5] = _uint32(g[5] + _rotateLeft(g[4], 8) + g[3]);
  ctx.state[6] = _uint32(g[6] + _rotateLeft(g[5], 16) + _rotateLeft(g[4], 16));
  ctx.state[7] = _uint32(g[7] + _rotateLeft(g[6], 8) + g[5]);
}

/// Key setup
void _keySetup(Uint8List key){
  /* Temporary variables */
  var k = Uint32List.fromList([0, 0, 0, 0]);
  int i;

  /* Generate four subkeys */
  if (key != null) {
    for (i = 0; i< k.length; i++)
      k[i] = _fromBytesToUInt32(key, i*4); // 16 Bytes to 4 UInt32
  }

  /* Generate initial state variables */
  _master.state[0] = k[0];
  _master.state[2] = k[1];
  _master.state[4] = k[2];
  _master.state[6] = k[3];
  _master.state[1] = _uint32(k[3] << 16) | (k[2] >> 16);
  _master.state[3] = _uint32(k[0] << 16) | (k[3] >> 16);
  _master.state[5] = _uint32(k[1] << 16) | (k[0] >> 16);
  _master.state[7] = _uint32(k[2] << 16) | (k[1] >> 16);

  /* Generate initial counter values */
  _master.counters[0] = _rotateLeft(k[2], 16);
  _master.counters[2] = _rotateLeft(k[3], 16);
  _master.counters[4] = _rotateLeft(k[0], 16);
  _master.counters[6] = _rotateLeft(k[1], 16);
  _master.counters[1] = (k[0] & 0xFFFF0000) | (k[1] & 0xFFFF);
  _master.counters[3] = (k[1] & 0xFFFF0000) | (k[2] & 0xFFFF);
  _master.counters[5] = (k[2] & 0xFFFF0000) | (k[3] & 0xFFFF);
  _master.counters[7] = (k[3] & 0xFFFF0000) | (k[0] & 0xFFFF);

  /* Clear carry bit */
  _master.carry = 0;

  /* Iterate the system four times */
  for (i = 0; i < 4; i++)
    _nextState(_master);

  /* Modify the counters */
  for (i = 0; i < 8; i++)
    _master.counters[i] ^= _master.state[(i + 4) & 0x7];

  /* Copy master instance to work instance */
  _working = _master.clone(true); // include counters
}

/* IV setup */
void _ivSetup(Uint8List iv) {
  if (iv == null) return;

  /* Temporary variables */
  var ii = Uint32List.fromList([0, 0, 0, 0]);
  int i;

  /* Generate four subvectors */
  ii[0] = _fromBytesToUInt32(iv, 0); //ii[0] = U8TO32_LITTLE(iv + 0);
  ii[2] = _fromBytesToUInt32(iv, 4); //ii[2] = U8TO32_LITTLE(iv + 4);
  ii[1] = (ii[0] >> 16) | (ii[2] & 0xFFFF0000);
  ii[3] = (ii[2] << 16) | (ii[0] & 0x0000FFFF);

  /* Copy master instance to work instance */
  _working = _master.clone(false); // don't include counters, they are set below

  /* Modify counter values */
  _working.counters[0] = _master.counters[0] ^ ii[0];
  _working.counters[1] = _master.counters[1] ^ ii[1];
  _working.counters[2] = _master.counters[2] ^ ii[2];
  _working.counters[3] = _master.counters[3] ^ ii[3];
  _working.counters[4] = _master.counters[4] ^ ii[0];
  _working.counters[5] = _master.counters[5] ^ ii[1];
  _working.counters[6] = _master.counters[6] ^ ii[2];
  _working.counters[7] = _master.counters[7] ^ ii[3];

  /* Iterate the system four times */
  for (i = 0; i < 4; i++)
    _nextState(_working);
}
}
class _context1 {
  int carry;
  Uint32List counters;
  Uint32List state;

  _context1() {
    carry = 0;
    counters = Uint32List(8);
    state = Uint32List(8);
  }

  _context1 clone(bool IncludeCounters) {
    var temp = _context1();
    temp.carry = this.carry;
    if (IncludeCounters)
      temp.counters.setRange(0, this.counters.length, this.counters);
    temp.state.setRange(0, this.state.length, this.state);
    return temp;
  }

  void clear() {
    carry = 0;
    for (int i = 0; i < counters.length; i++)
      counters[i] = state[i] = 0;
  }
}

