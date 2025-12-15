//! By convention, root.zig is the root source file when making a library.
const std = @import("std");

const suits = enum { SPADES, HARTS, CLUBS, DIAMONDS };
const card_val = enum { VAL_A, VAL_2, VA_3, VAL_4, VAL_5, VAL_6, VAL_7, VAL_8, VAL_9, VAL_J, VAL_Q, VAL_K };

const card = struct {
    number: u8,
};

pub fn bufferedPrint() !void {
    // Stdout is for the actual output of your application, for example if you
    // are implementing gzip, then only the compressed bytes should be sent to
    // stdout, not any debugging messages.
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    try stdout.print("Run `zig build test` to run the tests.\n", .{});

    try stdout.flush(); // Don't forget to flush!
}

pub fn add(a: i32, b: i32) i32 {
    return a + b;
}

test "basic add functionality" {
    try std.testing.expect(add(3, 7) == 10);
}
