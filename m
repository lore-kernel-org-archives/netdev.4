Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560668;
	b=qXGO1LAjNlYJOQefRGq3irrHgEHA/iYxU1T0/ZP/XOKQzPU8G57r7c/wF+Zq3QDS5NjR
	 xVVrSIoLtXharT549XmkznSZlLbcFqqADgf9jNQ+qk5RRlGvq07YQABycbq1uHtdDJAqE
	 F2wg0K5NA6j9qkKfkBoGnzx/Qoep26HRiP93uZyQhrvW2pkuV5PYIQD5SBKzJ/ZamQU0s
	 fj9cGJXkCuOTJ5YKa2R+hBZaX77hVODZ4OpjEejThvpzZAXO6FijN67slTdlHIDLDtc9i
	 2Lh/CRoRfHBu6qpD1/rYyjaR3hDBXPfx4Z/FLEsDUiSUFa1XE8IMpG+jUIXjyfquifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
	b=DLId0Gr7ClQyPmpoP1H9BS/rBcrbwYNR5xqbwKp8BEmPFfiVli1KC6VuwkjD9RcVlXkh
	 xYYQA1ZmqmSfJVN/UGamwHZBEtxq6mPlCM7xQiYWStf5661suomfG1v/ltyIJM9+3ZuC3
	 ccjJow2+HkjGf83+fifxqXHPFZSgk20dYfS6EqsMIWgq0HDag2uWE2YK+R7/3KVe/gg5R
	 pXTcnUkuZvh2fVx0eWBNfh/Dmwr2yril5vreJNWTus91ClNp1VlKjatsIPO31cOm5as8/
	 VLznoW7nPRUiMipIkhvFR4Fgl8fFqXG1Lk0sw+LbyibDEGHPp4sR9hSb1utD3dD4mvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwU9Qbho;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A47A606A684
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A47A606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IwU9Qbho
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-49a92144733so2502377f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:51:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560666; x=1796165466; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=IwU9QbhodXzlLDRauWBLrFbli/b9ei5ev5Yr6svDKdoANACaA9KLxcnMoSiHjB2uQL
         Fcdp5U9gh74slg4rFlwZHdSadfT6fhg4WDhi1i3MABxRtGG6ZDLzyDi7/+7EHkmIEl34
         S8KIhqYfbkxrK85wMruIrUnGuvmWJKChn7HwavPJsaDZ8C89ZfgYugOKlQjmdbHR7GcC
         HXjCYimCXcEMPCd7mKCxsIf90YhibXQBMus2F3VR+zJLk/Sy8ZBoqsmldO6zjOstdVyD
         l3ZweCwHPPW5c4cDA2tRXMo+yhYDHUqNsc2Qomy96/mVnHn5FtmOKe8Fy3oNPk/cubNM
         bVwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560666; x=1796165466;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=XfMR6/q7iIeikfmx4k8wMWy6WKL6Q3IO6x8QHQO8ndlHnSoXwoO9FY0oj/cBK7+4Mp
         oE3NT/dFKyUT7aaA8abtSThxWgE9rvf2X7QMs0US0X67ldvaHF6pqpPg0UwQyQd8NinY
         7AzLSEpSLgM/HnwpwQBNHIi+08RpkRDvYGXHBU7VW2AlYdLPgSNu52DB5BdmnuhfVeDk
         qsxUMAlgai20HrZ3kGaqTcSIATTas029n5ch9u4eD/kpjby7DRAlzvhTredsYi6Oba8b
         IFKGBK3Orp+jwNwqNLCMmPcxNRVjyJaraVDmxWghogXb96270PRgAKj7NrvbIn1rU3qn
         4zbg==
X-Forwarded-Encrypted: i=1; AL+hErEPC6wfcttlvHJ+8mUBH5iZNjHnBcYvAG9lrPhdN9Xjt6uAiNqiNZ01aMgCPC5nSQ5/axBrbSE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uu08VZkJQnePM6BkcHPr1+LmKtyG1wN+4DD3QZdDAkS5T6H7O
	/NJYEGT73Eq8te1sxTOa+udkDSMVec58hapVqTH3+sdtGhVoYFPGfUA=
X-Gm-Gg: AZFdTZeQrI2ri+Pdrsh/uV2IBV23plcOj7eJd+t8VObA/vbEVQebgfcA+uFyLn4No3i
	Z4J7nlbA/ehG7vO+XFy7MdNQ0tJOglpYbG0p0sFeai5xsPVmKamJ7ShYhoEFtc2mk89npHFVEss
	hMZYX0trsls2ffsqS6/yFO5XOT4vZAnjN6Qw2wmZDie7hpRewnPPyi5ce0no4a3TwPajw6OamC4
	sQYDs+SKnujeEQWMJ9vGs23jpuq52C5HmrBZmzfA607M7X70PjMvW++pAdbvcEWMoI+GyuW+xS0
	tuCzsKuHgYWPRIA4thpwVOLNq8ss8UgqFNXb41k1PwyLkxv1+jHYSOuoBnjpgzxPK4t/320CpDy
	R6yCt//aGpBazWlD/BhlqmUCPGPgB/agqyIB5jTZrHrFWijbkIn/bOtmHNoU4Wn+7jgHLK7xp/K
	iSQ56LxgJt3lF4rdRWt0/Ym6IB6dxoVuGFkrEskokKxslNxuqXfeFIBHC4M9HSoaqJ+K1v9NP8+
	jtZaL/7sGxA/CUj5OqM2XGEh/8rrKMur5bC6AtCPofiohGJS7Q+E8MckG8w5z2ePoXOuPh74aBY
	rz/9rrMWpmhzcuCX64kl+thR+DxmHvSLdyE68NrVr1B23wzPCdXUYxXtyirJVIBBgb8qAAT1ikT
	895QOo9UvBdHe4vwP/GN30pAKLDWxgHDy1RApTGMIfW1DjS9z7rlkks9MhiFpFZ4M1NEtVDUhYv
	sA6FwpdIsDoKxy0QNYuYM3yHufyvfr/S5b
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr318594355e9.22.1795560666345;
        Tue, 24 Nov 2026 14:51:06 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2ec1-8a00-a10d-4335-1e05-e7ae.310.pool.telefonica.de. [2a02:3100:2ec1:8a00:a10d:4335:1e05:e7ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm393839525e9.9.2026.11.24.14.51.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:51:05 -0800 (PST)
From: Tobias Philipp <tphilipp@gmail.com>
To: bpf@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
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
	=?UTF-8?q?Thibaut=20VAR=C3=88NE?= <hacks@slashdirt.org>,
	Stijn Tintel <stijn@linux-ipv6.be>,
	Daniel Mack <daniel@zonque.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Tobias Philipp <tphilipp@gmail.com>
Subject: [PATCH bpf-next v2 1/4] bpf: Fix alignment of memory allocator objects on 32-bit archs
Date: Tue, 24 Nov 2026 23:50:52 +0100
Message-ID: <20261124225055.87344-2-tphilipp@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Felix Fietkau <nbd@nbd.name>

The BPF memory allocator prefixes each object with a header that holds
struct llist_node while the object sits on a free list, and a pointer
to the owning bpf_mem_cache while it is allocated. The header size was
sizeof(struct llist_node), so on 32-bit architectures the memory handed
out was offset by 4 bytes from the 8-byte aligned kmalloc allocation.

The verifier assumes that allocated objects are 8-byte aligned and
allows BPF_DW atomic instructions on their u64 fields, e.g. on values
of non-preallocated hash maps, objects from bpf_obj_new() and local
storage. On arm32 the JIT does not implement atomics, and the
interpreter executes them via atomic64_*(), which are implemented with
LDREXD/STREXD on ARMv6K and later. Those instructions require 8-byte
aligned addresses; a misaligned address raises an alignment fault and
crashes the kernel.

Pad the header to 8 bytes to preserve the alignment provided by
kmalloc. Store the percpu pointer of percpu objects at the new header
offset instead of assuming the header is pointer-sized, and update the
copy of the header size used by the hash map memory usage accounting.

Fixes: 7c8199e24fa0 ("bpf: Introduce any context BPF specific memory allocator.")
Reported-by: Thibaut VARÈNE <hacks@slashdirt.org>
Reported-by: Stijn Tintel <stijn@linux-ipv6.be>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Link: https://lore.kernel.org/all/20260717183632.99195-1-nbd@nbd.name/
[tphilipp: rebased onto bpf-next, adjusted context in hashtab.c.
 Local storage no longer uses bpf_mem_alloc in bpf-next. On 32-bit
 this patch moves an IPv4 lpm_trie value from 0 to 4 mod 8; the next
 patch fixes that, so both have to be applied together.]
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/hashtab.c  | 2 +-
 kernel/bpf/memalloc.c | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/bpf/hashtab.c b/kernel/bpf/hashtab.c
index a2d0bfd4c..b84911054 100644
--- a/kernel/bpf/hashtab.c
+++ b/kernel/bpf/hashtab.c
@@ -2594,7 +2594,7 @@ static u64 htab_map_mem_usage(const struct bpf_map *map)
 		else if (!lru)
 			usage += sizeof(struct htab_elem *) * num_possible_cpus();
 	} else {
-#define LLIST_NODE_SZ sizeof(struct llist_node)
+#define LLIST_NODE_SZ ALIGN(sizeof(struct llist_node), 8)
 
 		num_entries = bpf_map_sum_elem_count(map);
 		usage += (htab->elem_size + LLIST_NODE_SZ) * num_entries;
diff --git a/kernel/bpf/memalloc.c b/kernel/bpf/memalloc.c
index 15684d0fc..29d62d864 100644
--- a/kernel/bpf/memalloc.c
+++ b/kernel/bpf/memalloc.c
@@ -33,7 +33,7 @@
  * Every allocated objected is padded with extra 8 bytes that contains
  * struct llist_node.
  */
-#define LLIST_NODE_SZ sizeof(struct llist_node)
+#define LLIST_NODE_SZ ALIGN(sizeof(struct llist_node), 8)
 
 #define BPF_MEM_ALLOC_SIZE_MAX 4096
 
@@ -148,7 +148,7 @@ static struct llist_node notrace *__llist_del_first(struct llist_head *head)
 static void *__alloc(struct bpf_mem_cache *c, int node, gfp_t flags)
 {
 	if (c->percpu_size) {
-		void __percpu **obj = kmalloc_node(c->percpu_size, flags, node);
+		void *obj = kmalloc_node(c->percpu_size, flags, node);
 		void __percpu *pptr = __alloc_percpu_gfp(c->unit_size, 8, flags);
 
 		if (!obj || !pptr) {
@@ -156,7 +156,7 @@ static void *__alloc(struct bpf_mem_cache *c, int node, gfp_t flags)
 			kfree(obj);
 			return NULL;
 		}
-		obj[1] = pptr;
+		*(void __percpu **)(obj + LLIST_NODE_SZ) = pptr;
 		return obj;
 	}
 
@@ -262,7 +262,7 @@ static void alloc_bulk(struct bpf_mem_cache *c, int cnt, int node, bool atomic)
 static void free_one(void *obj, bool percpu)
 {
 	if (percpu)
-		free_percpu(((void __percpu **)obj)[1]);
+		free_percpu(*(void __percpu **)(obj + LLIST_NODE_SZ));
 
 	kfree(obj);
 }
-- 
2.54.0 (Apple Git-157)

