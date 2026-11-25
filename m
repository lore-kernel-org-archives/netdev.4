Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795572280;
	b=S5pOc7Y3D/jQ32ViLL3MMOOIEo8c9tH4lOXVUQnvfSqzawJpLIDxcUhR1BF5Gts2eMjU
	 a7GF1MdCW3gTL75CwM67+EF8UkTwKONoA5GvWCp9zTZ4RREjylfbY03vFI9990ljUE1R1
	 BPZRshHHZ/x9GOhfvztgAkZ2FFvdUDgw/pizZtPcRq5CUYl9NvrrgCURfoSg6EvGlK6US
	 PT4mw+JhoCFjk9RwCV1jNfnKq6xT+pcVSmWORqYukoe6AZOyrSTllwi0ng5rEbM54klyN
	 6sSu0VHr9RJ+jDsOC5SR9nSdcP8NUXQ/u9JFWwRibO+Y/kwIfEtoIvmVO5riBq4FQDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dGO7sulYgNHzftB46ktTIErbuIAJZjxUMAKuV9Mlo04=;
	b=jlQAAQ4O4daUM3CWBL12T5IbovaI0FNjcEpaSnkME941PrSBMR/jxr0XwI9hytTkS/SN
	 RHl0vzuV4+dgCebTzsjjLhP1UFQoki0o033T8YW59tQaQHidpdlqUlycOVMs9s8hkRv+m
	 9hK0rUGyq7rDVJjSZHPmdSNd7A4mABA4pgdrkACjirgI5lsaaKw0HmW/pqYp4FWAR+ovP
	 uKX9lt3oES84lLgjHP7RhkwWEGpZSzPYtTqCFaLmvWwTIOz/gTFqs4loAjT2eAOHLvr6H
	 bTS59tOHs5RXRerYnxSgqUYngEd8F0Fvam7Uuvvu6tjkGUuo3J0npS0IlpBTp9l9pLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlYUFt5q;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA87606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CFA87606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rlYUFt5q
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb9f760337so3074734a12.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795572279; x=1796177079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dGO7sulYgNHzftB46ktTIErbuIAJZjxUMAKuV9Mlo04=;
        b=rlYUFt5q/amQTeNTEEhupoVDMMMHZ2KTrYknpHb1NVRsHAK+aMtARUIpXuLsxsT9hs
         eZM16v626XzFdgMCEVXB9eHxUcPDJPSd3d9f1rj59LooXWZ0ngWRcbWRvwNWm60VcHk6
         pSWxYABydX5xqP1kmv9e8sSbpuY5H+MI+xNlIGiLe6HMG93+FVY4/XR5hW0LaFm7UuO+
         Y08VkDIA6g2Q1URlTbCt/8RepAJbwzKhAubc7DNd3RUEOMZkJkCbf0tuVSa0PC43DGSH
         PJwHh6o1WgonI+AeITs3IvfNeW0l5nvW1OfCpnY0YvKylllh5PBRoAtJGgLxSeDo8mbn
         m0IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795572279; x=1796177079;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dGO7sulYgNHzftB46ktTIErbuIAJZjxUMAKuV9Mlo04=;
        b=b2w9XG8IGZO2fHG5+Q4byDvsXIZUpl7V8lldxUl5a/sFH6woUnU83QisopHidjqryt
         59qsln3BEHisDwCSH1U/XKMNKQyN4ncphhUTrjJXDjkCqe1AKlkzOu7e3CS09CG88CYc
         dYMF5rxKrd2/DZt5B+VCUKEv0u2p9S0L3WAbyoEQofo7wXbRdZiFqNqvbNjKwpNeWAtn
         tKFTytPxWl4a4deyhRGCce7o25xdmgw5sXgVn6YXgbKizPJgroCDJwATZglcLGgXIR9m
         cIMmnITioJ2xxbrc4j8OO/4SdSe09r1dPqQhGcNmIqEXJ1iqOw2ojvgP/738sgpcyoMk
         89Xg==
X-Forwarded-Encrypted: i=1; AL+hErG5kca6PvU9t5alMCq4UKqt64/dz9yj8tul3MRTg9YYro49obez7vMJn+wb6U267bE7PyfrULY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uGlb9GAcmxXPvalJqmOfSLVXNXKNLBRkyGJ2UTZUyzDNUyNlP
	o1W14U2JWG/QlcifnCSUS0NvNWL2I6HcSRset71iVlqxdGbPbt1XOSgi
X-Gm-Gg: AZFdTZd79zK6wlPT/nTMf2JooCMvgmVUO9o99HWQPS9yDS7YSZg24smnrBMNMHFMjZq
	2KyhBLqQpOZRW3Vn0Tq8IC5U6TGmWn1lmE8dnmMLKLQZuQ5XsnDirlKKHYmQGh71vtbLCcTw4hi
	jlZD4AVGBO+xMefcjykXSBFpfk8L56QpHP7AKjPKhtRc6f9xMbDifqZm08VB0i9oPsBKeOSdQDF
	yxL5f0beARg66cIm/kt/0OpSodIoEokBHagkBZex+SUcmeZFnQU/uN0omXgev2ztVs616ZRslaV
	M4y9ePmQIbL89cnTZILwxG+gzmaAqQ3qH6Hmdt/o6vqcZ/dOdFoeXTJUlSFdPKut2GgUJHCOgGu
	Brh8lKLPgfkjujaz1JQT/23G/wNh2HOozX5omSXGPD2Dq6wWCR8QJc/ST10TzWDEqIYZxovWC0E
	Q3llw9uLpCd+JLJOsEvYZuz9yOpk4+vgzFLSxD/Dj8uEit5f2OXBkwnecFG55xYPo02zPdjKyJp
	sTHLa7xyNROKGzmPJ4FIbIeqvJN1l5u4VPDVnxKzPbly2mA0z+bgEECVQfr6O1W+03ZX6Cbkgir
	ecREjxu4IOEg5OPpNEbCtfEsTrdOQEVKvJNOkv64dCNViaupPEBQxjyaqGBmr0aHm49rylcAylI
	YBg0ijV3OZazWMw==
X-Received: by 2002:a17:90b:2e8c:b0:3ac:a6a5:5757 with SMTP id 98e67ed59e1d1-3b41c8df55amr10658482a91.11.1795572278978;
        Tue, 24 Nov 2026 18:04:38 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405ecbd0bsm28174618a91.15.2026.11.24.18.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 18:04:38 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Magnus Karlsson <magnus.karlsson@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	netdev@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH net v2] xsk: keep the charged page count when pinning a umem fails
Date: Wed, 25 Nov 2026 11:04:33 +0900
Message-ID: <179556786851.2007362.7849536379916971930@gmail.com>
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

xdp_umem_reg() charges umem->npgs pages to the user's locked_vm before
it pins the umem. When pin_user_pages() pins fewer pages than asked,
xdp_umem_pin_pages() overwrites umem->npgs with the pinned count so that
xdp_umem_unpin_pages() releases only those, and xdp_umem_unaccount_pages()
then gives back only that many. The rest of the charge is never returned.

A short pin happens when the tail of the umem area is not mapped. With
RLIMIT_MEMLOCK at 16 pages, three registrations of an 8-page area whose
last 4 pages are unmapped leave the user able to register only 4 pages,
for as long as the user has a process running.

Unpin the pinned pages directly and leave umem->npgs as charged.

Fixes: c0c77d8fb787 ("xsk: add user memory registration support sockopt")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260421172951.A7052C2BCB5@smtp.kernel.org/
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
v2: target net instead of bpf (Alexei)
v1: https://lore.kernel.org/all/179552079829.1290967.12345053263834529704@gmail.com/

The issue was found by an LLM-guided test generator that we are
developing as a research prototype; Sashiko had flagged the same leak
in its review of an AUTOSEL backport. A reproducer, which runs as any
user:

#define _GNU_SOURCE
#include <errno.h>
#include <linux/if_xdp.h>
#include <sched.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <sys/resource.h>
#include <sys/socket.h>
#include <unistd.h>

static int reg(char *addr, long len)
{
	struct xdp_umem_reg mr = {
		.addr = (unsigned long)addr, .len = len, .chunk_size = 2048,
	};
	int fd = socket(AF_XDP, SOCK_RAW, 0);
	int ret = setsockopt(fd, SOL_XDP, XDP_UMEM_REG, &mr, sizeof(mr)) ? -errno : 0;

	close(fd);
	return ret;
}

int main(void)
{
	long pg = sysconf(_SC_PAGESIZE);
	struct rlimit rl = { 16 * pg, 16 * pg };
	char *a;

	/* no CAP_IPC_LOCK, CAP_NET_RAW for AF_XDP */
	if (unshare(CLONE_NEWUSER | CLONE_NEWNET) || setrlimit(RLIMIT_MEMLOCK, &rl))
		return perror("setup"), 1;

	for (int i = 0; i < 3; i++) {
		/* 8 pages, the last 4 unmapped: pin_user_pages() pins 4 */
		a = mmap(NULL, 8 * pg, PROT_READ | PROT_WRITE,
			 MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
		munmap(a + 4 * pg, 4 * pg);
		printf("short umem: %s\n", strerror(-reg(a, 8 * pg)));
		munmap(a, 4 * pg);
	}

	a = mmap(NULL, 16 * pg, PROT_READ | PROT_WRITE,
		 MAP_PRIVATE | MAP_ANONYMOUS | MAP_POPULATE, -1, 0);
	printf("16-page umem: %s\n", strerror(-reg(a, 16 * pg)));
	return 0;
}

Without the patch, the 16-page registration fails with ENOBUFS: the
three short ones leave 12 of the 16 pages charged. With it, it
succeeds.

The patch was written with LLM assistance; we reviewed and tested it.

 net/xdp/xdp_umem.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/net/xdp/xdp_umem.c b/net/xdp/xdp_umem.c
index cd8643360eb3..15ef424e2765 100644
--- a/net/xdp/xdp_umem.c
+++ b/net/xdp/xdp_umem.c
@@ -109,17 +109,14 @@ static int xdp_umem_pin_pages(struct xdp_umem *umem, unsigned long address)
 
 	if (npgs != umem->npgs) {
 		if (npgs >= 0) {
-			umem->npgs = npgs;
-			err = -ENOMEM;
-			goto out_pin;
+			unpin_user_pages(umem->pgs, npgs);
+			npgs = -ENOMEM;
 		}
 		err = npgs;
 		goto out_pgs;
 	}
 	return 0;
 
-out_pin:
-	xdp_umem_unpin_pages(umem);
 out_pgs:
 	kvfree(umem->pgs);
 	umem->pgs = NULL;
-- 
2.43.0

