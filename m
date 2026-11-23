Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795464956;
	b=11sNRot94jswlUEsW1Lwobb89mu0j4Wj8wl286WiDslrX737vJ+1qX68UGs0xBflgQ6c
	 pEOWlOKGCwbEYo0elEBOhOHbtCvIJoPLkHF2M0inVQtYZHbasapa+lDzAuusoEuwv8T2b
	 EQ48cy4eHehuUrWPIvDM/hgIOjNmwMUIHxStLg9kanULzRVhV/ctoMmMMkQuCiChnSffI
	 CAUn7YjrehhcNh957572nWyTWX/pcVZiM9LX8AiRPh5OinW5fmi2tyBmCNmNxbWhMYoRc
	 Qqeo/jMaVCFNmfKDfp2FR0S9ZIx5o4eA805Ws8nBVR6PyBkXtZdZMRTvok9GXGRlhVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795464956;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=27MlAWo/OUwBzjsWXnjeRgbeMFRpk2w6dzujp5UqCY4=;
	b=JoFR/YCct7/oy8papT2GgmJQye8tKixZj7v0mqFnclxQATHSwg4rv+gOgDrlmJT2Mz4H
	 FwSAvD2nFFPG1jyXlfb0aL+1cS0PqFfgQzNywMFMcMpMlAWwBsrV16uOLTdsub7hTjJg9
	 lnryOket7r9n7pvyqH/vbIVMkjdXPqXCxPa6rmIRX3WMKjJCZ/ImHqxHsT/WZ/5m2OYh5
	 lSaoK3/H9vhGKNd9t4YcyD8RljFmXYSOfyjFyiOe+6sODTJSxmdnm+lXhUd+1h85+Uee0
	 PpkSD58JAdSGuyF4qPkaZ5SQzgenAxTS/JZL86i39ipEMnfuffvD/Ow2r7dgRAlANFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLwS+G4h;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036A9606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jLwS+G4h
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795464955;
	b=LUSmTbpnnUIkHWVZDHwN2l3X/q07bQZhmuakB9azMsQHLc/AQ4BPegpZaeybqvA8z+IN
	 jUSs+u5yBUthV9JlZn2cM+iTTVd4piYyRKtnPOyt2KvFjoQLFCGIQ5PbyFW26o9n3J8b+
	 9sOZWxM4rZh+heSCkaxTjFU4FNRO8K4tdV6ntM43HKZYbQfEkyoE2uaPun00ZFUoZN4S4
	 nW0yVhWC3dFAPW5BEmLJx5wr1OumHx9CzciHY3+PX5yFLlH2SQY3Wk5/E0qoz558a2H8e
	 xCVsajUCLnd77zKQ+AWE0Bya8znxrKOtsW3thLH4qWDHFMKOh2TLjRMeKZck7uBYFHQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795464955;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=27MlAWo/OUwBzjsWXnjeRgbeMFRpk2w6dzujp5UqCY4=;
	b=k1EDxZSIWQ70f3HlKxLdgvol+bKPNW2QfM+9sugdTaNNUWiLJ/TICe5WKeI2zqB4Qky3
	 3iIKjNaoeMQZFLg5PJMaNq69GYPSZyKoWAV1iFNoVIp8fxCtyYMVFxIGpJFT6ebtJuvQG
	 PJLQF79ly3Z2g1YX+G1jxhbt/gyEmuKpsaliZWMmnO8bcGwBVuyfmEIzMKIH/jhZ5kU17
	 /IB4dd3pwxjbNwUrWoHtIKVd6h1yCcp4DawjVYKM9DVSH4Ngsoiun84qZ9oknzs0E+UKw
	 MPq7kM1CkKpriMgD2ochyflPKJ//VeC9vgg2jZml3wirdMMMVSchgFK0hd6VZ1t9zNw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EF9641F000D2;
	Mon, 23 Nov 2026 20:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795464955;
	bh=27MlAWo/OUwBzjsWXnjeRgbeMFRpk2w6dzujp5UqCY4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=jLwS+G4hs19SFe8V7LSddFOuxpB77Aysv8hGY9u+umSFKG40pabOWKrrBo0a82jrQ
	 q98qIlCIDgyZUtnSOlgsRq4eaaOgTkKZcoZRlyjggIAScje0rQ0lK9a6aKVm8mTGbl
	 rUXbwT4aLG4JvhL3Lb4vaWHAuUoqyJM5IIvy9QEI9liggQwbTUsOirMO88gSQh4nfG
	 a6DwWm5kT3QkY28ZUsFzkYZrQSnIGBK8Ddidy4lnsuVp5dz82p1ro7Kqn5+Owwb5RO
	 D9W35k1YEKOO12FYOctUolIjKD0EKUaDNoWEPMWG1vVVcurqnN5Z28HrgqJ8R8A7yd
	 b1lJHyACCfBqg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 82F4A4C6AD;
	Mon, 23 Nov 2026 20:15:51 +0000 (UTC)
From: Amir Hosseini via B4 Relay <devnull+me.amir.fyi@kernel.org>
Date: Mon, 23 Nov 2026 20:15:49 +0000
Subject: [PATCH] mm/mm_init: don't shrink large system hash tables below
 low_limit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-mm-hash-low-limit-v1-1-8a803aa8ac70@amir.fyi>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB0wSTHgVcRFjFMzYrRktC2Id
 2+sy7f4/wChxCTQFAckerPwumSosgAf3DIS8pANutK1UtpgjBicBJzXD84ceUNjnXEP660fFOT
 ulejJ3/+z7W7L3k/kt2sE5/kDSiF5bXUAAAA=
X-Change-ID: 20261123-mm-hash-low-limit-37a3a47c7cd1
To: Mike Rapoport <rppt@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Eric Dumazet <edumazet@kernel.org>, "David S. Miller" <davem@davemloft.net>
Cc: linux-mm@kvack.org, Muchun Song <muchun.song@linux.dev>, 
 netdev@vger.kernel.org, Amir Hosseini <me@amir.fyi>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795464951; l=4501;
 i=me@amir.fyi; s=archbox; h=from:subject:message-id;
 bh=WPCrCh616UcUkUJ0vkYRNurwFSh+B3LJalviBGxSKIY=;
 b=dDXYaITR/9+vETOai4ym8o/T+Iz7M6pTmCu5CpZPCow7sXOPhxBS5s8oXwcLtmoU6p46fwI7z
 YjAnvL44ac6CW5F+m6/Es8JyJhJtkMJGiBgn0mqyBgqXnUp5a1xuazL
X-Developer-Key: i=me@amir.fyi; a=ed25519;
 pk=YmuzvXl0k+J8pTqIG0kjwtCeJ1ggyIgBHm2jFmzNbeU=
X-Endpoint-Received: by B4 Relay for me@amir.fyi/archbox with auth_id=1620
X-Original-From: Amir Hosseini <me@amir.fyi>
Reply-To: me@amir.fyi
Content-Transfer-Encoding: 7bit

From: Amir Hosseini <me@amir.fyi>

When an allocation fails, alloc_large_system_hash() halves the table and
retries until it is down to a single page.  It does not stop at
low_limit, although commit 31fe62b95866 ("mm: add a low limit to
alloc_large_system_hash") added low_limit precisely so that callers need
not check the size they get back.

The TCP source port perturbation table depends on that.  It passes
low_limit == high_limit == INET_TABLE_PERTURB_SIZE and neither
_hash_shift nor _hash_mask, so it cannot learn the real size, and
__inet_hash_connect() fills and indexes INET_TABLE_PERTURB_SIZE entries.
On a single node system hashdist is off and the table needs one order-6
GFP_ATOMIC allocation.  If that fails, e.g. because most memory was
reserved for HugeTLB at boot, the situation commit e67b72b90b7e ("tcp:
use alloc_large_system_hash() to allocate table_perturb") was meant to
handle, the table is silently halved and the first connect() writes up
to 240 KiB of random bytes past its end, typically into the TCP
established hash table:

  Table-perturb hash table entries: 32768 (order: 5, 131072 bytes, linear)
  ...
  Oops: general protection fault, probably for non-canonical address 0xe480dbf6b420b3d9: 0000 [#1] SMP KASAN
  RIP: 0010:__inet_lookup_established+0x168/0x5d0
  Call Trace:
   <IRQ>
   tcp_v4_rcv
   ip_protocol_deliver_rcu
   ip_local_deliver

Stop halving at low_limit.  If the linear allocation still fails, retry
the same size with vmalloc_huge(), which this function already uses for
tables that are too large for the page allocator or when hashdist is
set, and which does not need physically contiguous memory.  If that
fails too, panic as before.

Reproduced on v7.4-rc4 in an x86_64 QEMU guest (virtme-ng, 1 node,
KASAN) by failing just that allocation with CONFIG_FAIL_PAGE_ALLOC and
fail_page_alloc=1,100,<space>,1, where <space> was measured with the
kmem:mm_page_alloc tracepoint so that the one injected failure hits the
Table-perturb allocation.  Without this patch the table is halved and
the kernel crashes as above on the first connect(); with it the table
keeps 65536 entries (vmalloc) and the system works normally.

The reproducer and fix were developed with the help of Claude Code.

Fixes: 31fe62b95866 ("mm: add a low limit to alloc_large_system_hash")
Cc: stable@vger.kernel.org
Signed-off-by: Amir Hosseini <me@amir.fyi>
---
 mm/mm_init.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index d99af80ec752..418068bad006 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2359,6 +2359,7 @@ void __init page_alloc_init_late(void)
  * - it is assumed that the hash table must contain an exact power-of-2
  *   quantity of entries
  * - limit is the number of hash buckets, not the total allocation size
+ * - the table has at least low_limit entries, callers may rely on that
  */
 void *__init alloc_large_system_hash(const char *tablename,
 				     unsigned long bucketsize,
@@ -2371,7 +2372,7 @@ void *__init alloc_large_system_hash(const char *tablename,
 				     unsigned long high_limit)
 {
 	unsigned long long max = high_limit;
-	unsigned long log2qty, size;
+	unsigned long log2qty, min_log2qty, size;
 	void *table;
 	gfp_t gfp_flags;
 	bool virt;
@@ -2420,6 +2421,7 @@ void *__init alloc_large_system_hash(const char *tablename,
 		numentries = max;
 
 	log2qty = ilog2(numentries);
+	min_log2qty = max(order_base_2(low_limit), 1);
 
 	gfp_flags = (flags & HASH_ZERO) ? GFP_ATOMIC | __GFP_ZERO : GFP_ATOMIC;
 	do {
@@ -2445,7 +2447,19 @@ void *__init alloc_large_system_hash(const char *tablename,
 			table = alloc_pages_exact(size, gfp_flags);
 			kmemleak_alloc(table, size, 1, gfp_flags);
 		}
-	} while (!table && size > PAGE_SIZE && --log2qty);
+	} while (!table && size > PAGE_SIZE && log2qty > min_log2qty &&
+		 --log2qty);
+
+	/*
+	 * Shrinking below low_limit would break callers that size other data
+	 * from it, so fall back to vmalloc, which needs no contiguous memory.
+	 */
+	if (!table && !virt && !(flags & HASH_EARLY)) {
+		table = vmalloc_huge(size, gfp_flags);
+		virt = true;
+		if (table)
+			huge = is_vm_area_hugepages(table);
+	}
 
 	if (!table)
 		panic("Failed to allocate %s hash table\n", tablename);

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-mm-hash-low-limit-37a3a47c7cd1

Best regards,
--  
Amir Hosseini <me@amir.fyi>


