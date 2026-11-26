Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722237;
	b=YHlgnbbCZjmo7KStgJfMRVwe4g9g1pBe9pWJ1DGXTsII5L75Luo6udt3le5sqXHH5gnO
	 m5Mpz0v6/trhocq+uVP3sHw1xHPfatNdgHN7QX5R3afuE5DQLPYCEu3/i3CHiBqGFjwxy
	 kF2gqghamfkHsu327qoF1rTHr/78DTrLoH8pl/t/xQpnGIxCyBFp5KWMl53AES84QT6Ae
	 10QNTq3RdAN5HxMEPTecz4Ty2iGNifxLX0I3aack3VUrNgTf6xLuX64no9M4z5EKM/jzp
	 ZKouYvstMfoyoXoVNl9SULx3dwDI0E0ocBXGtiBFiPQCyT/tjDXifJHeFs71P2OFD+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
	b=z9s9AIvQ5wfk029XbPnhM5ztoTbxIEJYIMtyau1PDsXVyR6pxIzfkU0yhjTIeUDoN/Pk
	 wG+erkzD/t5nKry18l49gCRUAvHbFtsiHuvNCDjtSSII+78wTONNsQmiY0HoDrMzTyKF9
	 QKVDAuABMoGpZlamLgNxlfAaNpziCdI5lZV960048dsYvymiR5wXGV4eE84gnPhDXf/bQ
	 jGqr1j8xONYojpu0hMvi18jo/Ev/kZfh+Px26c7vBZMqphMSGWM0J+jGakrHjFfJd96zo
	 AR9uOWyd+98vMx2ItNrNADr/I36p7B+us/SLLH2JV7QrXkb/oL7w0Z90AzxddACqy/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyVbppDE;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC6606A33E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 19:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CCC6606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PyVbppDE
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491971ac844so6557698f8f.2
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 11:43:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795722235; x=1796327035; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=PyVbppDELwapfZejZuEVjFUH+2ZfV/Vl6jrAWcWIjWx5a6Zm6N9KeTAjL5jJgpU2ir
         1VWVY790G4blO1jscYj9zrrw6pKG+5mc3NbgtDk7xOeZVES9LGSr1Po7vQXHibHmBDzk
         sbJumCKiGZ2vXSfR1vZu0QrheYNpdo/sETD/+9C1okhk+rXeCusWM+TCZ1APkkVhBf+2
         SWCTAyudwBNRfVCNmghUQ8RTzXSu6KbfHjIF6kHM1NRQ8gvrGvleM+u6n01hukNarfVM
         R+6q989ebo6QDLUO6NOSABum1KiqgMxbXZan7PwD2cqMlNR+l1Gh8oqRDHkJmgF4T7HD
         gXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722235; x=1796327035;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jrigqiEu/nUvTtr8hgpZahiDD4O3PEjOJSdql4Qjodk=;
        b=Sn47sKGh+xYrSPNYfW6GPqpq9AoxNh+pIgniwuWWSPE+M2VlaPGyfUc2yxjjNclzO4
         o3hZU5h6RT5IvoX4AAuyXLWMFmGRRsah6gT0CFfSo9nOoQPVBLAInd+4+ZapKwEsFkk4
         Rzvxaxq+W5HsPzOqaAlJPo1Q1eYv0QVOVFx2shKh8dSAv4OQ7o8u+4e+aq5SUgg4B7if
         QOAk5O9z1bEbbRNg8qsydTwN12SzyppIC9uvtQ2/J04BlEM27BEDH6RVg77dS3LpBiyp
         hSa8QuohY+gV5Q9Pkbwq8ia/Ot1rGXZU1SjJ+kbxJ6Fr8wbdPyCoUFAtxSc3UJOPkeK+
         rrrg==
X-Forwarded-Encrypted: i=1; AL+hErEeij26MYzZan+rIXXlwkg9w/QU3IT+Rmz5xLFikKyZf7RrZAAGHHKc/VNdGNG/4HpN7kOsiTo=@vger.kernel.org
X-Gm-Message-State: APuU4Z84gwgW8nRTQ4KmaPFAeQtloheBzHnZfVQrfiSYpVCtYkrXzEot
	sHoZhyfBKNUPIgS/1q1KJUGlssc8WAf0HyFo6hgkpT5Ifaa+IVj3JLY=
X-Gm-Gg: AZFdTZfLxSc5IBdbZRNJ9o7dppBA+G10eP3d7Z4DoWbAdfgRJ3bzDeQIawjsiIf8li0
	oXiolc2QAY6hNAtztQVWBVaVIr/j5PAYwurCTAbeh/OzAU0waIbeKzmELVif/XDG/PXIY2UKID7
	SXuDY5pxooKoJjclBN819ycdanLOG8/ajLhnrUps8n7nsk+Y2bmADCfn0xUY9omdD8q+D4XK9YQ
	poh5sEjR4et3W4hbZZYjIwj646dn2bfz0rFeY2+DFS46G2TZoC4Ub+scLeekqeDSEPasA/qWW2J
	1vKxFEPiqhbRXvAwjLbaQq8Tk12AwN7HpqRs0L2C2S9egvuMe9WopCvhaLKX8LL43SffA1ZxXit
	iSqS80dn5bWgeF6rWAES/Ovxy3B33T6jL0weQjooyTDZmxNTVEwIIHWFBS0JHDVAz3Iv637eJrV
	vD2d/JMyOuHiaaRtO64BjLifwHdOwVDqOoDYeqIH/bM/Jfm5STIquZjXByzzkuh7EYIccGvAlu4
	mCNLh4ZNBr8Y/s3f1XVh72Wk0cVr+0IGlfKjf1V5KAzj3lOJ/Zg7jeQ7r2nK3QPOZ2Bh9g7QV/9
	olB58nAYDEHTH0LfYNpIG7PGNyLXoTYPd43ORPrIYSxF2OiLweOVfUI7ff9Fn++EQeyrtQCQvTu
	RDNs+utRwqkC+ydGdz5AiS83v0p9yvhTL8ZoVE1KnAtu+luoVT12BL1VeyZSekXFqcDQsF0GXWw
	PUDolR+w0u0zrcpkK42TMKLO/KFHE+NKFSyQ==
X-Received: by 2002:a5d:5888:0:b0:48d:f488:f32a with SMTP id ffacd0b85a97d-4abb55183b4mr42236325f8f.56.1795722234481;
        Thu, 26 Nov 2026 11:43:54 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-2317-a900-4811-d431-309f-6626.310.pool.telefonica.de. [2a02:3100:2317:a900:4811:d431:309f:6626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm43663924f8f.3.2026.11.26.11.43.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 11:43:54 -0800 (PST)
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
Subject: [PATCH bpf-next v3 1/4] bpf: Fix alignment of memory allocator objects on 32-bit archs
Date: Thu, 26 Nov 2026 20:43:44 +0100
Message-ID: <20261126194347.42466-2-tphilipp@gmail.com>
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

