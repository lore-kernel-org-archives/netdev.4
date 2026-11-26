Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722235;
	b=VlIgufBcK7pLRx9o9oLMnCko2aoCmDMoQ9XONHeBsYpHEisC8E39q4egXlxlQPBm3flb
	 NPTZpcXM1lKg89zY8+z0rWiBvzShX+Ov2ihTACiFTpa/+F9Y5GrdOFFkhADx1n2MGrWbh
	 v+zETo38qwis9wyYW/39+U9jIRF9V/0KkSS8f4P6vnFFWdrHoszn8dQm+x65XohKpc13w
	 Gq1swzcIdlbbD7SM34HeTv+HK5VwdlYJQqkJ/CQ7DmP8UifU4q/9twON8Yola40origC6
	 gFiedEgmdteMVFwfCZm4xw8yIUaRkpG1+4AN3IqjptZWbyRD2ZO22+DX3htzGwdAZqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0P+afiYP4rfSnxzXHVdIh7omPyidFVRRqauBrgysGMg=;
	b=Ls3ErUwlA4/NTGEkgSdw7T/nUZYmVTgXmsQ7dvPeU9ernCHU6MuTogXtpX54zbilpHfF
	 3r2Td225sd31nLCsYO4RTTrWRBJSaN/HNX+glxr052nUYu/J+jTVojp6+SaISzyZKKQqV
	 4zM8Fjs5jOgmfhlKkA4YEfvk+pLK/5AxOW3/5X9g+zeszY7EElBfCVzBVm75FqbC0w5BV
	 HGS7WWMrYLVr4OwjVs6CQGVf0nneBgMpvQWZg1R1YBg4m9l9I4nbahdrpL+QWXTjGa0rv
	 XUsKwAA6MRYvQHAcj1VdNtUe3yrmdh2YfrQ5/TmDUZigwajGGn+QH3T7+52N4pbGaRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhdSYHug;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84613606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84613606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fhdSYHug
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so70972865e9.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722233; x=1796327033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0P+afiYP4rfSnxzXHVdIh7omPyidFVRRqauBrgysGMg=;
        b=fhdSYHugrQHo09L4nLloEF4mk3hkzNwZBp9BAGnhIDY3iOWaBFG7EKz+9dqkISQJqv
         nmVKFwfaud19WOASH+xfGC4xeoRLVJaxxLdOURer63seqUvIi6aGkz6zxSNgvSHtwz1/
         W5zdi9Fbto0rMKrLe5cIuWrXHOLTDNlanztZD7WJp1QSTFg4dwKeTrxalfZzt+Z3TadO
         15HdPtkmZm5DJmLgqYEZbUjjij36sjBB2IhoiijlPy5DWgTti+gDfRfxyx/RoD9V9oV2
         tEKnE3gcWLEgP1vqxbeYEnTwFd4Gf9Y+DygwMnFhkPSeH6pAOhQ6n6zqB+YiT1MtPTXX
         DCbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722233; x=1796327033;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0P+afiYP4rfSnxzXHVdIh7omPyidFVRRqauBrgysGMg=;
        b=pZoxh28N9vTkuNpysO11eGXvrn+P1BuDVSAcXe4zoSDBZXLJeUU31jO1uY8UyjWVxs
         pEN2eQZ4Sh7BijaHRXkMdoOcqp8hCrZpNVp6HZmdDrjkVD5SRaMNSNm2b2tYVPEjQW1c
         puaWTlm4VboUPOW0Rsm9fwzol0ScgmNR85zK1nedGNuc5Mq/CoYi4gGDi9EAf7ciP8cH
         MfDGfTUXstGfGo8oLBZy618XQhl+gGCgpqGRtO4BJ4r6cycT50nq5g2NoKV+JPzieHNz
         V9JdCa8rGwqH11h5clW70dqbQk8Z23A55AZwRY5gfvTgJGEr9wGBUuBcTIxt2vWJDaWu
         b0Hg==
X-Forwarded-Encrypted: i=1; AL+hErGpNGQQP7W3SCuDmGwcTVGWCQbmRn/hd5KHFiZlT3g3IyunpR+xJyACVWj6TgzZTW3ZGHd440g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TCiLoD2Aj//rOjxnlKwFybby0xpdkoDBTC+QHxR3qQICCM0Eq
	FygEa6I82pMZeDZWXvXv723eSRZy+2RG1IsE0PQ7r7Mnvs/NVhy6Xzc=
X-Gm-Gg: AZFdTZei4t3uS+w1OTq6Q3qxS6yjTYQXCZ2FFmd2Vvu8IYWumKWLaeCDw6q4sVMseiZ
	CFIoxYJTt/GbnKt63rRDJwxsLWdQr9pkVnoOsUVHJihlAprGlQYVH5Hj59loaIbd3HM6Bk4ZDdc
	ByrM6cHEHxxJhKOqK6e1h3lCdOXztOC8ExRmavHfhnGSHcxh1fd3+yRO2+Wgz+2L365dnDZTkTb
	8oc9EhQbZHLdV8UvkyH5Zp+ChVhBja9HNppDr4VGMaxEu/k73gjGQjytztGOPFAewUhH24iDocT
	mwWlj202tJPkxgXse2F7kTnDkFuKi/Wwjdn3AE7++FiFX45DB+gq6O9wlnVp0KDmrwXADNTQjXf
	4sHyXMuLzTXWLZyOdGcV4i1cEKsBbvWmQeKxoLdCyzWlSA8u5rpjGdWubEKHxEB3IoImVisfoP7
	B9atFs6QN6S8iF6U724uFGjFnCCWeKmTW1w/1pbpA71fU/a5232Da/HnuorG6Zag3RoUlLI3/A8
	pqXVXBHqORx04I2+xNyXiRQ2CUU74/TzIHFSEzMi/wM/2RceXzBIP6VsIOKvm9ggrGJ1KqMISae
	4CVix2IXPBWSCRFVKNOeOrRLRsxHJjc2RPo51Q0jgj18xwbu32WI858KzYIC81+ZEvpynXSPzZO
	jrhIkgBShncfq7cXZhn5QaUvNUTZykESHrB+vLdutK4neehCTPI9rvg/p5sptWPCLaWkiSZJ4xu
	pHhTjqxvKLxMjybsk3H0J8hSPd0tuS6Goe
X-Received: by 2002:a05:600d:1c:b0:4bb:9dbd:feb7 with SMTP id 5b1f17b1804b1-4bb9dbdff35mr194083605e9.9.1795722232705;
        Thu, 26 Nov 2026 11:43:52 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:51 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Tobias Philipp <tphilipp@gmail.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next v3 0/4] bpf: Fix 8-byte alignment of map values
Date: Thu, 26 Nov 2026 20:43:43 +0100
Message-ID: <20261126194347.42466-1-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The verifier checks the alignment of BPF_DW atomics and 64-bit
load-acquire/store-release on PTR_TO_MAP_VALUE only against the offset
within the value. It assumes that the value itself is 8-byte aligned.
That does not hold for all map types. Address of the value mod 8, as
measured on bpf-next (see Testing below):

                                    64-bit    32-bit
  lpm_trie, key_size 8 (IPv4)          4         0 (by accident)
  lpm_trie, key_size 20 (IPv6)         0         4
  hash, rhash (BPF_F_NO_PREALLOC)      0         4
  devmap, devmap_hash                  4         4 (harmless, see patch 3)

On arm64 the JIT emits LSE atomics or LDXR/STXR loops, LDAR and STLR
for these instructions. They fault on misaligned addresses; with
FEAT_LSE2, LSE atomics, LDAR and STLR only when the access crosses a
16-byte boundary. On arm32 the interpreter uses atomic64_*(), i.e.
LDREXD/STREXD, which require 8-byte alignment. On x86-64 a locked
8-byte access at 4 mod 8 that crosses a cache line is a split lock,
which is fatal in kernel mode on CPUs with split lock detection. None
of these faults is fixed up.

Patch 1 is Felix Fietkau's fix for bpf_mem_alloc on 32-bit [1]. It was
posted in July and is not applied yet. It is included unchanged apart
from a rebase, because patch 2 depends on it. It fixes the hash and
rhash rows and the node alignment of lpm_trie on 32-bit. The Sashiko
review of that posting points out a pre-existing 8-byte load of the
4-byte percpu pointer in the bpf_per_cpu_ptr()/bpf_this_cpu_ptr()
fixup on 32-bit. Patch 1 neither causes nor fixes it, and this series
does not address it. Among the 32-bit JITs only x86 supports kfuncs,
so only x86-32 can reach it. Using BPF_SIZEOF(void *) for that load
would fix it.

Patch 2 places the lpm_trie value at the next 8-byte boundary after the
key and shrinks prefixlen and flags to u16, so that nodes don't grow.

Patch 3 aligns the devmap value.

Patch 4 adds a selftest that checks the address of the value returned
by bpf_map_lookup_elem() for lpm_trie, hash and devmap. It executes no
instruction that needs alignment, so on an affected kernel it fails
instead of crashing.

Patches 1 and 2 have to be applied together: on 32-bit, either one
alone misaligns the IPv4 lpm_trie value (see "+ patch 1" and
"+ patch 2" in the table below), and both commit messages say so. I
kept them separate to keep Felix's authorship; they can be squashed if
that is preferred.

The other map types that hand a value pointer to programs return 8-byte
aligned values. cpumap has its value at offset 20 on 32-bit, but the
verifier does not let programs look it up.

Testing, in disposable QEMU VMs:

- arm64, defconfig + selftests/bpf config, QEMU with HVF on an Apple
  M-series host (FEAT_LSE2): map_value_align fails on bpf-next
  (lpm_value_align: 4, devmap_value_align: 4) and passes with the
  series. With the series, test_maps passes the lpm_trie basic_ops,
  batch_ops and get_next_key tests and the hash and array tests, and
  test_progs passes pinning_devmap_reuse and xdp_devmap_attach
  subtests 2 and 3.

- arm32, multi_v7_defconfig + BPF_SYSCALL, QEMU virt with Cortex-A15
  (TCG): test_progs is hard to cross-build for armhf, so a small static
  program does the same check as the selftest: an XDP program looks up
  each map and stores the value pointer in an array map. Address mod 8:

                         lpm IPv4  lpm IPv6  hash  rhash  devmap
    arm32 bpf-next           0         4       4     4      4
    arm32 + patch 1          4         0       0     0      4
    arm32 + patch 2          4         4       4     4      4
    arm32 + patches 1-4      0         0       0     0      0
    arm64 bpf-next           4         0       0     0      4
    arm64 + patches 1-4      0         0       0     0      0

- pahole matches the layouts in the commit messages: lpm_trie_node
  data[] moves from 24 to 20 (arm64) and from 16 to 12 (arm32), and
  devmap val from 52 to 56 (arm64, size stays 64) and from 28 to 32
  (arm32).

- W=1 builds of the four touched kernel files on x86_64, arm64 and
  arm32 produce no warnings.

Not tested: runtime on x86_64; test_progs on arm32; selftests that need
CONFIG_FTRACE or bpf_testmod, which my configuration lacked. That
includes xdp_devmap_attach subtests 1 and 4 and the bpf_obj_new and
percpu allocation tests; they failed to load in the same way with and
without the series. Patch 1 does not change anything on 64-bit. The
x86 split lock case comes from arch/x86/kernel/traps.c; I did not
trigger it.

The lpm_trie bug was found with AI assistance while trying to verify
the correctness of map value accesses with formal methods. Patches 3-4,
the commit messages and this cover letter were written with the help
of an AI coding assistant (Claude Opus 5.5). The code of patch 2
follows Alexei's suggestion.

[1] https://lore.kernel.org/all/20260717183632.99195-1-nbd@nbd.name/

Changes in v3:
- Patch 2: place the value at round_up(offsetof(data) + data_size, 8)
  and make prefixlen and flags u16, so that nodes don't grow and move
  to a larger kmalloc bucket. This drops the BUILD_BUG_ON(), the four
  round_up() calls and the comment that was not in kernel style
  (Alexei).
- Patch 3: use a single-line comment (Sashiko).
- Correct the FEAT_LSE2 statement for LDAR/STLR in this cover letter
  and in patches 2 and 3 (Alexei).

Changes in v2:
- Target bpf-next (Alexei).
- Fix the 32-bit node misalignment at its root in bpf_mem_alloc by
  including Felix's patch. v1 rounded data_size up on top of a node
  at 4 mod 8 on 32-bit and so misaligned the IPv4 value there, which
  is aligned today (Alexei).
- Drop "data[] __aligned(8)", which changed nothing (Alexei).
- Add the devmap fix (Alexei).
- Add a selftest (Alexei).
- Correct the commit message, which claimed that the IPv4 value is at
  4 mod 8 on all architectures.

v2: https://lore.kernel.org/bpf/20261124225055.87344-1-tphilipp@gmail.com/
v1: https://lore.kernel.org/bpf/20261119155317.11469-1-tphilipp@gmail.com/

Felix Fietkau (1):
  bpf: Fix alignment of memory allocator objects on 32-bit archs

Tobias Philipp (3):
  bpf: Align lpm_trie map values to 8 bytes
  bpf: Align devmap values to 8 bytes
  selftests/bpf: Check that map values are 8-byte aligned

 kernel/bpf/devmap.c                           |  3 +-
 kernel/bpf/hashtab.c                          |  2 +-
 kernel/bpf/lpm_trie.c                         | 22 +++++---
 kernel/bpf/memalloc.c                         |  8 +--
 .../bpf/prog_tests/map_value_align.c          | 51 +++++++++++++++++++
 .../selftests/bpf/progs/map_value_align.c     | 48 +++++++++++++++++
 6 files changed, 120 insertions(+), 14 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/map_value_align.c
 create mode 100644 tools/testing/selftests/bpf/progs/map_value_align.c


base-commit: a58375b858fac35afb78a3dd68ad6a19c01799eb
-- 
2.54.0 (Apple Git-157)

