Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560670;
	b=uCCkd2oSHtZ0m4u90dTQGpzNDQs9F5a0oasLYy9QO13KFVdk0vxS8uzdLePniVR3fQKM
	 aEtZFApVqglyM5XqysMaLsWYeNa2pBd/+f/FTniCEkcLXCy0jIrmCk/sAeLQPAOHBtrBO
	 qTVsWqQRlL/N41iQK8/w6SwXoE/OKgpbysdeXewJ9TL4D14IX6SQaMnXLY80T/MZvG4zi
	 MqC6ynZJnIkQKeRkL9nzypYu2+8TtEMVmZPrOZ8zJXlqdB5Xa1nEy5pq+AM1qlYo4qY6s
	 XRw0NTqxM+dF1eQQ8AxNLixWGtZhKxQNbELyOm7o1ZVLUGRaNrXlh1liMvSp0b1Hwrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8fbqFXfnJmZ5wlNeBVcYahiL5PvY2DhQX6o+WRRQBHU=;
	b=mjdrW6xytZmYbSIUR0yRwvgO0kIBvq9NE5xr0JPET7fA7nbDUL1ocb6ClLY+jBkttOfy
	 SqXNdGbMCyyASmll8VhGd0/bv4W/5Rze9hNhn8WU8XoJ/q+pe5mhXSyARmdF8iXvfXRHU
	 C1FC2vLqF1a1JlOS4x5DMhimiJ6RF0YJsdV8gj63JgjkxWM/fXuyQoB/n/w9/jruehqrL
	 8Eh7qube7uGVW3yTj0qlbW90UmXwcHAfcdt9GThhBufnZPkghy6QVhRYSM52NhIhSzv/F
	 JzG3YdvGZx4fQKMJXBEmjtE11RaDcG62QdTqnFwCQ+vIuoklP2E90VZCf7c7v6c1h1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCdFeoTW;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E129E606A339
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E129E606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GCdFeoTW
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49d05d51553so36958075e9.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560668; x=1796165468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8fbqFXfnJmZ5wlNeBVcYahiL5PvY2DhQX6o+WRRQBHU=;
        b=GCdFeoTWhhvd2pA4jmshxSJGXNPRUZNH67/i8ObsgUB1JZxDHmGK3mdIOqwQPjyViC
         lz6/JqDiNWB92qK4G43yckMYusH5A0jEpSUcDChtrQ6VSXVxfuz2xPRCklFLkg+eF9Tx
         TDQcXH9ldQ5ozQcKo2tG9Gb7uuEJWtP7rRcsK8lPetm7LWwbVXJmtbqcP5nPLaOTAhUZ
         aST/YzJnKL6jDsMzAqYBcvuNdkte+C4841S8XhQdI5n9zuM+xhTeLFWwEvMwg1Uet0JA
         A9jNjlb7B3B9ZRLtQixaO8caFViJteaXCYBhn4QZB6maKkNhABs4DmYMDYZVjmOGLqz0
         v/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560668; x=1796165468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8fbqFXfnJmZ5wlNeBVcYahiL5PvY2DhQX6o+WRRQBHU=;
        b=PANJY1rEquwKnmEDvFVYKl4pZz7Y95ZeAFyPnSH5Att3/N3UevO3DIrmBxMby4jv9V
         PHkR4vcY+5jB59JeW7QkRdUxByB4lw4OxbsOPwUZwK+zw+UWxMopP3naomubbeHOEZda
         n5W3C/ly7vRfaJHw7lLOTOn6XEbSpGOO/sBulJpH0YYBaTMj2Du0Do4pXNX8wPiYBHjN
         LzmOQr0HqpLUFmGfGk9YY3kdHE/fwydtojlFYC8yk29oc6od5HOOZe3EOlhxtlgtSU3/
         MzKxc4TqXqJyYQ+1tAsWR0gxHuu8IvkubZpjsGcMMRiQf5rlbPOeP+qrJqU81DH3cxLD
         /uwg==
X-Forwarded-Encrypted: i=1; AL+hErEwZJjPUlY0fZNN5BeZrLQJ/5RMsSr4Yg07oi5Bi/y/JuwlHmxizVFNm6rpQZNfCyYPjN7hhHs=@vger.kernel.org
X-Gm-Message-State: APuU4Z94sb2dyLoyyatOMsLo2AvYoUwVodV+qG/N0AiKxtEK9aA4VQmA
	LLpAWQUGpoNHHpHVt+jvzzFel1eJdXpM8oH0ZTBZz22AIv5CnB3Ozzg=
X-Gm-Gg: AZFdTZdY7TSZyw4Q+a/dyqlZgLxin0kCqQ84T26lEPAJ5gOfOVWEKpqOEJsHyyG6oI7
	eILISGbqwovJ9KRDOkFaHlCeCcKnYIgMiVB8QRh6alYGWCY0gBTnjNmQNRZCnhjwIJKcj/lpc0k
	B2TgHbnPgoq86MZbG8EzDzLVt0zhrJTLoSKgK9Pi7q6T5AAxRdc1cPHs5VOI7sxcuWPsN5UuX57
	1SK0ZGhvY451K713CTCmh1LH2OSGkn94P5H2yuOJEjSP7x85qFUnIgmVhBRLHvVbP5uFsd3b/RR
	TUzVVW/vJCYt7zTINAZjzcsfi2BiH7wJRmcP9QK/pCiQ/bSgzbiu7RwZjrSabFpCVJ+hmgRpoOB
	U3Ej+R8E1jpWB1ufQ8s2flscg93STpyN7MTyyGSqPOsxl8K+5BV5LAvMI3ZBGjRte/ohY6VUK/D
	Gm4+cK5HrMVQCHakA5UA3dDRoiiycrFoXuoTTMcrLpXOsTFhHo+6SHsdLKib/4f5fa8u27GoAag
	E/50PJAtmHy2g/gvu4nioH6Aoz8NXKy4pKSFCcAfZ/Xmkiu0PZ43qktQPEohGJ0GoMQppx3WM7U
	/vFvmeDTuFmrc7zLMH0K/3bn3mBqcOIK0vn1IWCJ2pT9m1+K4DblS9moaRrK2te2kNvfPNATc8a
	LvYgCj4tOJZjdmlIMbR9YwokZmFfSnuLitXDaUNUI63JxAS4dbxk1d5Hrb4GepPl0jy4cboU54q
	QgOWZVAiZcGl0ZefKz/x6smIfNlHgCUcnc
X-Received: by 2002:a05:600c:4f0d:b0:4bb:5c97:f4b1 with SMTP id 5b1f17b1804b1-4bb8881941bmr368118945e9.24.1795560668275;
        Tue, 24 Nov 2026 14:51:08 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:07 -0800 (PST)
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
Subject: [PATCH bpf-next v2 2/4] bpf: Align lpm_trie map values to 8 bytes
Date: Tue, 24 Nov 2026 23:50:53 +0100
Message-ID: <20261124225055.87344-3-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261124225055.87344-1-tphilipp@gmail.com>
References: <20261124225055.87344-1-tphilipp@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The verifier checks the alignment of PTR_TO_MAP_VALUE accesses only
against the offset within the value and assumes that the value itself
starts on an 8-byte boundary. It accepts BPF_DW atomics and 64-bit
load-acquire/store-release at 8-byte aligned offsets of a value.

lpm_trie stores the value directly behind the key bytes, at
node->data + trie->data_size, where data_size is key_size - 4 and can
be anything from 1 to 256. Nodes come from bpf_mem_alloc, which returns
8-byte aligned objects (on 32-bit architectures since the previous
patch), and data[] is at offset 24 (64-bit) or 16 (32-bit) in the node.
So the value is 8-byte aligned only if data_size is a multiple of 8.
For an IPv4 trie (key_size 8, data_size 4) it is 4 mod 8.

On arm64 the JIT emits LSE atomics or LDXR/STXR loops, LDAR and STLR
for these instructions. All of them raise an alignment fault on a
misaligned address. FEAT_LSE2 relaxes that for LSE atomics that stay
within a 16-byte block, and for LDAR/STLR only if SCTLR_EL1.nAA is
set, which Linux does not do. The fault is not fixed up. This oops is
from a 64-bit atomic add at offset 8 of an IPv4 lpm_trie value, which
crosses a 16-byte boundary (Linux 7.3.5 under QEMU, HVF on an
FEAT_LSE2 host):

  Mem abort info:
    ESR = 0x0000000096000021
    FSC = 0x21: alignment fault
  Internal error: Oops: 0x96000021 [#1] SMP
  pc : bpf_prog_cc9155b98965fc5e+0x64/0x90
  Call trace:
   bpf_prog_cc9155b98965fc5e+0x64/0x90 (P)
   bpf_dispatcher_xdp_func+0x14/0x28
   bpf_test_run+0x11c/0x360
   bpf_prog_test_run_xdp+0x358/0x548

On x86-64 a locked 8-byte access at 4 mod 8 is a split lock when it
crosses a cache line, which is fatal in kernel mode on CPUs with split
lock detection ("Split lock detected").

Round data_size up to a multiple of 8 when computing the value offset
and the node size, like hashtab does for keys. IPv4 nodes grow by 4
bytes, IPv6 nodes (data_size 16) are unchanged. Add a BUILD_BUG_ON()
for the offset of data[], which the alignment of the value relies on.

This patch and the previous one have to be applied together. Without
the previous patch, nodes are at 4 mod 8 on 32-bit architectures and
this patch misaligns the IPv4 value there, which is aligned today by
accident. Without this patch, the previous one misaligns it.

This was found with AI assistance while trying to verify the
correctness of map value accesses with formal methods. The patch was
written with the help of an AI coding assistant (Claude Opus 5.5).

Fixes: b95a5c4db09b ("bpf: add a longest prefix match trie map implementation")
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/lpm_trie.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/kernel/bpf/lpm_trie.c b/kernel/bpf/lpm_trie.c
index 4d6f25db9..44ad5c163 100644
--- a/kernel/bpf/lpm_trie.c
+++ b/kernel/bpf/lpm_trie.c
@@ -286,7 +286,7 @@ static void *trie_lookup_elem(struct bpf_map *map, void *_key)
 	if (!found)
 		return NULL;
 
-	return found->data + trie->data_size;
+	return found->data + round_up(trie->data_size, 8);
 }
 
 static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
@@ -302,7 +302,7 @@ static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
 	node->flags = 0;
 
 	if (value)
-		memcpy(node->data + trie->data_size, value,
+		memcpy(node->data + round_up(trie->data_size, 8), value,
 		       trie->map.value_size);
 
 	return node;
@@ -597,8 +597,14 @@ static struct bpf_map *trie_alloc(union bpf_attr *attr)
 
 	raw_res_spin_lock_init(&trie->lock);
 
-	/* Allocate intermediate and leaf nodes from the same allocator */
-	leaf_size = sizeof(struct lpm_trie_node) + trie->data_size +
+	/* Allocate intermediate and leaf nodes from the same allocator.
+	 * The key bytes are padded to a multiple of 8 bytes, because the
+	 * verifier assumes that map values are 8-byte aligned. Objects from
+	 * bpf_mem_alloc are 8-byte aligned, so data[] must be as well.
+	 */
+	BUILD_BUG_ON(offsetof(struct lpm_trie_node, data) % 8);
+	leaf_size = sizeof(struct lpm_trie_node) +
+		    round_up(trie->data_size, 8) +
 		    trie->map.value_size;
 	err = bpf_mem_alloc_init(&trie->ma, leaf_size, false);
 	if (err)
@@ -766,8 +772,9 @@ static u64 trie_mem_usage(const struct bpf_map *map)
 	struct lpm_trie *trie = container_of(map, struct lpm_trie, map);
 	u64 elem_size;
 
-	elem_size = sizeof(struct lpm_trie_node) + trie->data_size +
-			    trie->map.value_size;
+	elem_size = sizeof(struct lpm_trie_node) +
+		    round_up(trie->data_size, 8) +
+		    trie->map.value_size;
 	return elem_size * READ_ONCE(trie->n_entries);
 }
 
-- 
2.54.0 (Apple Git-157)

