Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795525446;
	b=b6+38Dv5s6n8UqXVnlLli2g1dITFJB4O3xlyXZ3R8bHH9YlGAmxew8hoZYkcqEGJyQwg
	 +pzK1jEOl6S8aR0T2Hvtn7pNCe06nIwM0FVtIZzveb6BiBgUBFefSRjjKJ8CWE/JmWLB1
	 l5nI8VNYJYagDdEPifbVGktIA7y/HM+VYWr4Vuy0DPiyVAP/z67JVOrQuTS1n32549FPf
	 NWh9Ye3+7B3MP9TqqFusUTAPTTiLyep7xgb/LztQaxywWJlLhNbyTDFPEu0QRiXM0T5l5
	 y64jM5FNfyF2hx5IZYhiKZkrg1JOULaaRnfC2QUeCdl9BjZS8wmRFcaiuDwgydyuCQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795525446;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=+rKxb7dU0UMEzCyAusf6VPpzW2HyfM8DXyzbe16sF6o=;
	b=M+jDAIj1Lp/IWdPrK+u5pVuMKqrjkpW81vEHwsAPaMkN+A7Me3UGU45loJ6h4pw2qa2j
	 mCGjceekIcJhNw9I1RBdmn7by7uG/FSnw7BcAoy24LQhLb6+HmEzqlYNWVUlTomfYTUXT
	 yg5RmTFSlDgI6VDYnnIj7YeLCMnN23ggt1ePmKQRCZQI8Zf2WGfnfJ2vfz5y5woiLDUAL
	 2wyepBXdfQeik7M8uU8OvUvqnx+TqL0UPgv/Hc9SPr/SnJXLZ0b4MiBuLAC1mM6mvBhMR
	 BzczncZu7ZE+0OOj6DTsvfXbgliOYqhw2OUss8Als8hxYGAU3BmEW30j6aHFJTf0UJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I+N/sQ09";
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E4C606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59E4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+N/sQ09
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1939455b3a.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 05:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795525446; x=1796130246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+rKxb7dU0UMEzCyAusf6VPpzW2HyfM8DXyzbe16sF6o=;
        b=I+N/sQ09fQuEQXJ9fyOuMfHGIQhhtYbdQQDKkIKriD2d/WQsO6T3VxQv+IRpSS9W3t
         bQGCb0qtr8bc94vBDzm6kOAtFgmzqOZM/i8oroHGAXR0hGtW4Fj0cq35JB6NhDBmS9uR
         x6oA84jtUd+1jvyOWLoWa7vEQg4euFUJ5LIUMvKnt6q1UanGPTNGcDMRvSPLsGXg85XO
         DfZ6uDgXDyXj5wJOD9ClSQPEOsLjpfg2Lu7q+2nmeVjyHxKAp/xQOItLtJfwKWmzkqpQ
         1Fe8CVOcnYGT62DLvBRxI5bIVljfJX1fc5sJuR3bEsOaCQ3H/dYavYYb2aPjl46jbpbr
         VqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795525446; x=1796130246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+rKxb7dU0UMEzCyAusf6VPpzW2HyfM8DXyzbe16sF6o=;
        b=xVkp2cc8AAYrX88VIAqJ8b4ogYgUeUvSj64RAKfQPzO6aRo2B1Xtn/iKLUsWAo+9zl
         9ju2i8hywrPJLqJsbLM2J3RyuYcEfkJG7XVo997ScdN/psos8augJ6lsbuBepEK2OHHR
         zoElBxCPdlDYrBftzDOb2Lbl8T+dwHrJr7OWlFlxF+VAporFRUm3zUDXlan8AEA7GVaD
         C510wDf5b0AJHvbFwITeo2hBv6OZ9M8dfQtsBzTV+IlzvtkkPlAVkGOPSo0nnWw1FK0n
         0ZNVimLUGSZrC3vGmvGf3OioGbcV92VvNKUpdVZRfRPaWsfeqVrTGwe+GRK7edH7mJJr
         yKVQ==
X-Forwarded-Encrypted: i=1; AL+hErFMhaoS+Q0sfPZuQUCuSDVCwQvdUzB82mIg4pcwbbmauXwr66W9KvyQjXM0ELNDS6hlFDikTr0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pJDC54Uyr/bxB/3dStDPY7hjY402g22kqzLB/+ms+wwAgHQzR
	gjqfTQjVX+ILMfqYx2IkKtawCHmuyX2KAzwIiR/cbtvHYyYgFni6POl6
X-Gm-Gg: AZFdTZd4FTtpRNADFxcIvtTxt6hvMnSg1C8RoTy40kaTxss5cRk74EYdF9SGYMpyvDc
	2pP5RKmdofY1HuJE1gQb0jYT4XWuNndlENMXObgAAo2Ioh0ENWWDnKRpx4TyKGOKFIxj1eNkS9f
	F6U1PAZ74oqn8C1Ln8JmeWB5KMy9GmL8Y+DT4TlRIVa5vxrv6sDWBER8fuNQtGC75RwlU84dZGQ
	z6u4OtdXqbq+S58PpF5pgtKDj8+h5lBVXnuKgRjLDhboH39e+3MssicLlg6QX8gZiUMd0CYi5JN
	aODT+D0bkjQZBLjtsKeoK1DEEv6AjCMja80ldRXgljvGU9IExdEmZeL48cpTP2t5lmzLA2L/kt2
	rUADN/0f19DeU2Qm9E9ek4fx06dHQa2lQgsFacDv7pwGUwD1lGAt2JTj9WIvY+5m53svnsiwNrg
	vfIAr9tHlcHHDz9UVMhEZ+0VZT553y99Dko5MZMbNYy2ec6UMaUx4K6EEsdkh0683GVH5RQg0YC
	strx2vkQIGqGml9MhiQlTMLECUgVBQHnhu9G3WjwxcfB/6L+//8HmaKo4mIfz3ULJW04/ZAGpmB
	k4ghpg283s0yjVVFFp7xYyZEjstPfOWB3soEE7kI0PFhd3ut8GeDNPX7BkiOXFMYOZgpG2VtHcW
	PIRc8Qi2FEH1Q
X-Received: by 2002:a05:6a20:c992:b0:3e1:88d6:60e6 with SMTP id adf61e73a8af0-4014a27f154mr12795163637.10.1795525445647;
        Tue, 24 Nov 2026 05:04:05 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm7194090b3a.31.2026.11.24.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:04:05 -0800 (PST)
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
Subject: [PATCH bpf] xsk: keep the charged page count when pinning a umem fails
Date: Tue, 24 Nov 2026 22:03:59 +0900
Message-ID: <179552079829.1290967.12345053263834529704@gmail.com>
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

