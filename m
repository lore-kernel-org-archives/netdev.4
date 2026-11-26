Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722238;
	b=mbcs4l+w2cY8MLx3VgSJB1iyoNqabyS0q2vdGfdlJiAOhQn4+k4FWitvb62Ga8ihnPhH
	 xiG60tQ6dcYN1zKJCitMAInjDmmizWla2AXgfvWQ5CMmDsQP27N3e7Tsh0fwFIx14wWAv
	 aAS8poM243MtHmVxMcz+mHCu2hu39nd3Gg89OQhdBAN9Wqr6MACsUyDr5WrGK+DLulSfd
	 7yVRxoY21huFZClIoWxpV+KvhsD2xPMOUvJ2Ho3qvh09xZmvYJURcZuwBHZwzVkHzPjwK
	 YMqxks/O12DZJoi+fC9EJ2LMI7HIg5+4FmMdJuHLf2E7jR5wY8pJew7r4fHaOPRn4oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722238;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BnkFZTPH4GOUqir1kCk9Cv39W3Zv9BvNJCi3IdBbyjU=;
	b=n3O0aqN6sIdQguJG07APeuHfIl/vD7IvfmRP4zuvohqI5WdMRoTaL7zZ0Bm7ENsfVZNX
	 hGzfmXta2zBieoH+QZyAMeKj90ZnKiKibsqXhBPqHQtnVr3nkPV/EDLc79fVNU/nAxF6E
	 4fgoiWFRHH0x2bDzjvpRLTToEXFjhpeJpzZpwvgSVyZElzZdtQf/KVMnLNIVAN4pbk9jb
	 qdu28B3OnHLtK7kN7MTNBfsUu4oUE/6MRobmA4nvl5CF5ZcaTfCOfcmuCAlMoJzpKPc0Z
	 fAUT3NbBz9HHKfS4rQtfOuOTfIfe2cKnAxVdqrJc3//sxHzn0lo682CQbHwWpA28dpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0417aK2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62F6606A33B
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:43:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E62F6606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c0417aK2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so74513565e9.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722236; x=1796327036; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnkFZTPH4GOUqir1kCk9Cv39W3Zv9BvNJCi3IdBbyjU=;
        b=c0417aK2h4DeaBfC8O80Gmv2V1OcMVKosw053rakSHQDG5HN8ItGEGalDt3r8BanEN
         +slBLNCOnKaBr6UByfZpHBEuMHs7aKVXSvo40HPMsb00gFPRyvlJsdgWvW+r4wCJo2No
         tj0zCuKH/36RKdxihfEiL5oLgp3xMSekszdFbdTAfycOfPa5MKaIjscudhQxnS3gl5vd
         NTmqP9jFT407ueJQL02avxySJhlJTOJIVFGBhUN6tVcPhNV5OML0NOltG/QeNqDakqyd
         +q6Bd26C+Anw7cXUpsXaYgGDFgzpY+JvTuj7ZatoeqRGMN7YV3qugqxM1XyPW7JkBdNx
         foMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722236; x=1796327036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnkFZTPH4GOUqir1kCk9Cv39W3Zv9BvNJCi3IdBbyjU=;
        b=EBfAXeXZoCWaj9tqQhLdXxO7msbgK2+Jdm0VRq26xsSyFNi8BzpKirqd7+MZyrW4C+
         H2TJM283/seL0xWF8bW4/+sHb164o1yxxJytcMPA7hnJS6IctxM8v6jra9hO/vlDaUNz
         g7Jb7SOl4NoTdqG2/JzRxNPqvBdIOA2p/yT/sQFXoV0WqI0OmQTo3ZQzmZOyl8CVTBT3
         ejQ1k2hoM5ilzunLoQQcvCpWJ5/oLocQ8X6hNR4LHGEiNYxTiI/BNtipZ9u7kFuakR93
         jRSH8EVFSxz/i+8uZoDEgMUz7dumZLXgDyG8hfYzeXqNmKDW+vPmxOEILNAZm1WEnO5a
         RDeQ==
X-Forwarded-Encrypted: i=1; AL+hErHWMw1Zb8SzBbraXMA7/MTZ76Ps+WDvObisUH3hR3EJGgQY2N0voDhQVeh3hUCTea/JcbLDWfA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fS2Bm4FjpHHJk+ZiorgNKYKHJiPEoVsgiteBr5FV5MdPza4T0
	/POMalcRl2L4YsSeIUBEQZVkZbqulR+WFb2+XmyvHK0PCt0INGF/lWk=
X-Gm-Gg: AZFdTZdvY+3GSlWP9qzFpXB6+4qDSQt2eJOX8z9xUHA+GLkBiFv2si9Y6oEA3zlfGmz
	DmoVrAKKjHMkF7JjryOh5M+X+NWe9jPe4DQOmvjiE4pY9Epp3MFUngf/HTr6i+d/paH+iIuphcB
	ACD6wfbSwfoApY6XLzOsRPyzq5S/adDirS2DSdyM/D3CuFWEdlK46/1WBGuUbuMHNOnxyAwvrOt
	XHk5JRvr9y9GEivcJIRXWSr7/7DCC/92mrU9nI1QQAIaQ+6JUfhH7FTGatFR3vJL2EKhWBkBRGN
	AMnD8ivmoKSmlOG4az2lOnIUAFLlSUcRNy5mLNykH9TM4Yxs8IvULDd4umrYJW4wTiOA3b5L3l/
	5zqQ6SDiL6tFulXY8npdYXUPN26pnALrbgPm4LG9pCzzdH/574PiLHOKhbh1JA8EIoM6oMCePCQ
	B5tOfp08zeqbie/dVMib0lcsB5qqiD1FYBakd7KunjQ78oBzklclx4sIlV2M6FzPPW1fHV7ieVi
	352Ligh2r6Q5JDzmNnnS8vR2eHaMCXgM8JE/jZD5hqSBLlti3gwftSodn1nQcZHmOxoJzzjgMuQ
	f0KArVOeez/ZsF9hfxzJuwu6c9yxmsMlJmYurnxUndnPU056/JilK71ZbBX0P1Wld/rDu48B4Eo
	Jp0kYqjXiI1EASEhEiiFYQf9NbQ+OznUJLJYeyYcVkR+ymffJUbK/a9XZH7yvDtJsidaZlG93Of
	oON+lauq7uXu8ubktdl19qiZ1Lc3r1VBo9
X-Received: by 2002:a05:600c:a088:b0:4a8:cb23:f71b with SMTP id 5b1f17b1804b1-4bb8880b7bamr398332865e9.18.1795722236197;
        Thu, 26 Nov 2026 11:43:56 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:55 -0800 (PST)
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
Subject: [PATCH bpf-next v3 2/4] bpf: Align lpm_trie map values to 8 bytes
Date: Thu, 26 Nov 2026 20:43:45 +0100
Message-ID: <20261126194347.42466-3-tphilipp@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261126194347.42466-1-tphilipp@gmail.com>
References: <20261126194347.42466-1-tphilipp@gmail.com>
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
for these instructions. They raise an alignment fault on a misaligned
address; on CPUs with FEAT_LSE2, LSE atomics, LDAR and STLR only do so
when the access crosses a 16-byte boundary. The fault is not fixed up.
This oops is from a 64-bit atomic add at offset 8 of an IPv4 lpm_trie
value, which crosses a 16-byte boundary (Linux 7.3.5 under QEMU, HVF on
an FEAT_LSE2 host):

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

Place the value at the next 8-byte boundary after the key bytes. So
that nodes don't grow, shrink prefixlen and flags to u16: prefixlen is
at most 2048 and flags has one bit. data[] moves to offset 20 (64-bit)
or 12 (32-bit). Bytes that bpf_mem_alloc asks from kmalloc on 64-bit:

  data_size  value_size  before  after
  ---------  ----------  ------  -----
  4          28          64      60
  4          60          96      92
  16         16          64      64
  20         12          64      60

This patch and the previous one have to be applied together. Without
the previous patch, nodes are at 4 mod 8 on 32-bit architectures and
this patch misaligns the IPv4 value there, which is aligned today by
accident. Without this patch, the previous one misaligns it.

This was found with AI assistance while trying to verify the
correctness of map value accesses with formal methods. The code follows
Alexei's suggestion; the commit message was written with the help of an
AI coding assistant (Claude Opus 5.5).

Fixes: b95a5c4db09b ("bpf: add a longest prefix match trie map implementation")
Suggested-by: Alexei Starovoitov <ast@kernel.org>
Signed-off-by: Tobias Philipp <tphilipp@gmail.com>
---
 kernel/bpf/lpm_trie.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/kernel/bpf/lpm_trie.c b/kernel/bpf/lpm_trie.c
index 4d6f25db9..72084ac79 100644
--- a/kernel/bpf/lpm_trie.c
+++ b/kernel/bpf/lpm_trie.c
@@ -25,8 +25,8 @@ struct lpm_trie_node;
 
 struct lpm_trie_node {
 	struct lpm_trie_node __rcu	*child[2];
-	u32				prefixlen;
-	u32				flags;
+	u16				prefixlen;
+	u16				flags;
 	u8				data[];
 };
 
@@ -40,6 +40,12 @@ struct lpm_trie {
 	rqspinlock_t			lock;
 };
 
+/* The verifier assumes that map values are 8-byte aligned */
+static size_t trie_value_off(const struct lpm_trie *trie)
+{
+	return round_up(offsetof(struct lpm_trie_node, data) + trie->data_size, 8);
+}
+
 /* This trie implements a longest prefix match algorithm that can be used to
  * match IP addresses to a stored set of ranges.
  *
@@ -286,7 +292,7 @@ static void *trie_lookup_elem(struct bpf_map *map, void *_key)
 	if (!found)
 		return NULL;
 
-	return found->data + trie->data_size;
+	return (void *)found + trie_value_off(trie);
 }
 
 static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
@@ -302,7 +308,7 @@ static struct lpm_trie_node *lpm_trie_node_alloc(struct lpm_trie *trie,
 	node->flags = 0;
 
 	if (value)
-		memcpy(node->data + trie->data_size, value,
+		memcpy((void *)node + trie_value_off(trie), value,
 		       trie->map.value_size);
 
 	return node;
@@ -557,6 +563,8 @@ static long trie_delete_elem(struct bpf_map *map, void *_key)
 #define LPM_DATA_SIZE_MAX	256
 #define LPM_DATA_SIZE_MIN	1
 
+static_assert(LPM_DATA_SIZE_MAX * 8 <= U16_MAX);
+
 #define LPM_VAL_SIZE_MAX	(KMALLOC_MAX_SIZE - LPM_DATA_SIZE_MAX - \
 				 sizeof(struct lpm_trie_node))
 #define LPM_VAL_SIZE_MIN	1
@@ -598,8 +606,7 @@ static struct bpf_map *trie_alloc(union bpf_attr *attr)
 	raw_res_spin_lock_init(&trie->lock);
 
 	/* Allocate intermediate and leaf nodes from the same allocator */
-	leaf_size = sizeof(struct lpm_trie_node) + trie->data_size +
-		    trie->map.value_size;
+	leaf_size = trie_value_off(trie) + trie->map.value_size;
 	err = bpf_mem_alloc_init(&trie->ma, leaf_size, false);
 	if (err)
 		goto free_out;
@@ -766,8 +773,7 @@ static u64 trie_mem_usage(const struct bpf_map *map)
 	struct lpm_trie *trie = container_of(map, struct lpm_trie, map);
 	u64 elem_size;
 
-	elem_size = sizeof(struct lpm_trie_node) + trie->data_size +
-			    trie->map.value_size;
+	elem_size = trie_value_off(trie) + trie->map.value_size;
 	return elem_size * READ_ONCE(trie->n_entries);
 }
 
-- 
2.54.0 (Apple Git-157)

