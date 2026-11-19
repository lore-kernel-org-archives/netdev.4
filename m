Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795091397;
	b=ZFqq6PjRknc7S4N5yjEE2p0xvvTVnTbuekdmywIvjmvSXlV58v8dzN3Uv5kEsROxm704
	 fqMoMtmCDyjv3Mw2ABOEtgTJORMzMGtsuItMUni4lGdmIIf1PEdAfIcf9Th5ac3DJq8E8
	 2UeHnbMmgeOdz6T6Gkn7RBvTBHSj408kVq9eLw3JaA3q/BBscI6xlm74eMd1gmjQMKSNt
	 hkSPG42ImyH68uQre9ulxM+iCrp6bwMpsYV2H2yvX1BmdY1E7vVtRlXyVD3jZI9639EeR
	 cd2fKrxIAw2ZYatOlIJBaHVIO6EmdqN3kqmoWiTzpbEugJYaQbhu/kEuKDCWhN29q3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795091397;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qpWp7RKQvxLSpEEh7A+u1LSSChiWS6u79l4SciL15T0=;
	b=cjXmt8EQL7KMCcIz1rSvUFCfMyuYDmsw7EUngZEiIE6ZL6HsxNfJbDJt64pX6knLdBub
	 8jMhnBia0FB/503U8XJlXE52pOBVdrgLHdAHTTiX+4r5a1bENvXWk/zBByVthtH3lBbc6
	 HST39+Igb2NedYvtXUgsunoAoVLcIMyQVaMJaDJqiNvx0pI2aeV88hly1Sx8Y/zDtQRUr
	 Y5DnGPtKT+91Jvu8/KfmPlzmj5ydvLQe3fJpvN46HocJGwFcSl6Ko53p/LJiSpobbUYhJ
	 3TpfDGFSOB42OtoJgoGaTl5cnIXc/WdwkwO3WO3gbFTqc7xwPU/KrjGBWyioo5fS6Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=F2jafbBE;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1B0606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 12:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F1B0606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=F2jafbBE
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1408804f8f.3
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 04:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795091396; x=1795696196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qpWp7RKQvxLSpEEh7A+u1LSSChiWS6u79l4SciL15T0=;
        b=F2jafbBEseeHmbwhUrufqlP+n3L341gWcgPmpaQJkNSCV8j8dOtPMoyZagdKBQTqmh
         wTBJJV9L0zmsva/fUOpqz6j1arWAGXeDHADc1+7JDdE8YD7RopYmycbpWfa0BUVq2iWp
         y8p1E387kqh0MnVVTrheCCVJc9zIUJnO2bypTUVGPAzBv94FFinyh4JquBQIWlRodBmS
         CgR5Uv5/EqR4Ap8Ii6LqQZYPAk4VlyzPIkYIH/vaY5nSpttxKA8EYQe0x43SHeizOIo9
         5lQrddiEGqXUPkhNREgn9shXoRKp4GBXVHP5BkQ3GcUPJSTbT1Bsgz0GFy+lPOX/ykqU
         VhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795091396; x=1795696196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qpWp7RKQvxLSpEEh7A+u1LSSChiWS6u79l4SciL15T0=;
        b=F1II5H+0Lm2lM6pF4gjFeOLrjE1MKq8F9ch/UgH18sGMN+cY/d7bu14dsyU0tSHEaO
         Pi+BO4xVjsrioch5v0QFakB34Bh2ohnpU+lvoqaFCJRzLqXlkRGi7qBe6m7WF9kfyJPH
         Rjmi5aDW1jDDOiMGfr1MlH7ke/Mu3oNQHXRkSaSygOkICZopm7LF/3x46GiU3WBYHu67
         VWBZRkrgnWIFiLldZXuOrLdn9sgjJl561gcaD4fuk+EdD4FDKDQ6Zz20U6Ij2xLPa01o
         Fnn3Lf3c+0CoE6TpSBufcYi34wX+ABEYVIVgQrLDLP+NXB8xz438Mkr7Rrj1J7u3StyB
         Xg4g==
X-Forwarded-Encrypted: i=1; AL+hErF/irLHUospc1G4yKTlUWBlFTC0HYeolcpEjRUo6TPXLMDXUGF3UDt6u4syIFEYOf8yluZV8oc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MP2Bw6XzeYNR/CTQVRMVNaOxabujEo+xf2VXHi8N1ZUG9eddq
	mGcg4T9gMZ7xWSyHfBcAWELh0clzXifzRurnGm1/VT8FsbNwMPqDBcdOtVu4vibWd9g=
X-Gm-Gg: AZFdTZeehOxpKu1PxvaNu7OYAMKLxu1WwsYQN0Y+iztG1HwsoofNzLRHNN+8PR8+r9+
	6kZZ+fPYtgESjGh/lkLSx390tUWx6unSlyap+pE5+lXtoef0WrSWNUImg8C4lfxg+GpZehFgk/H
	bAaZBvu+IUGg+RZyTKvzIIpr20WNKk/Wq4LkRz0SBbpr/C6P/1a+KE/Ed9uF/w3mDXHuTniq36s
	5LvaXdSoShBctjhOZlYsY5CpD0s2zGQ19bp65PPc0QXuxQ9k93xhZX3bLBoN7ulkE6juKu9Y502
	Rp4DQijrZ01sU7C4sbe07CPOXZme+eL1ykXdqpwevZ5EmPRI3x/U3RJyPg+7nlqodjDAnyRRxRb
	/p0D97U+fJrWH/J/dKxn2VlonwAy5qrq8w1aqkONlJSlmwJiOpUrQXuqw2dgf60k4rlEXxeNzUN
	x09ELj8XYl91cw3fO/ui2TK2X+17uhLesPNL0Tcx6ETECAfuGRJ/zf26U1cfZrpftsmDe8taKio
	Ci5TFvuICDSNBtTuxCxZ5hP3KxtJDLiP4Ro0qx8NMeYqvUKvNFUPyNqpnZGBFrIsmIJ01xLHzjz
	VZSFM+utqaodaadrSmmTYGVh
X-Received: by 2002:a05:6000:1a8d:b0:48e:d36:77 with SMTP id ffacd0b85a97d-4a633a63e82mr12936899f8f.4.1795091395668;
        Thu, 19 Nov 2026 04:29:55 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a6573bccb0sm10338670f8f.55.2026.11.19.04.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 04:29:55 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Wojciech Drewek <wojciech.drewek@intel.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH net] pfcp: drop packets until the device is initialised
Date: Thu, 19 Nov 2026 13:29:46 +0100
Message-ID: <20261119122946.1720693-1-amisiurov@cloudlinux.com>
X-Mailer: git-send-email 2.43.7
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

pfcp_newlink() creates the PFCP UDP socket (port 8805) and publishes it
(sk_user_data = pfcp, encap_rcv = pfcp_encap_recv) before
register_netdevice() runs ndo_init, which is where pfcp->dev is set. A
datagram that arrives in that window passes the "pfcp != NULL" check in
pfcp_encap_recv() and then dereferences a NULL pfcp->dev:

  BUG: kernel NULL pointer dereference, address: 0000000000000108
  #PF: supervisor read access in kernel mode
  Oops: 0000 [#1] SMP PTI
  CPU: 0 PID: 26516 Comm: pfcp_race
  RIP: 0010:pfcp_encap_recv+0xeb/0x1d0 [pfcp]
  Call Trace:
   <IRQ>
   udp_queue_rcv_one_skb+0x24a/0x560
   udp_queue_rcv_skb+0x4f/0x80
   udp_unicast_rcv_skb+0x78/0xa0
   __udp4_lib_rcv+0x519/0x5f0
   udp_rcv+0x25/0x40
   ip_protocol_deliver_rcu+0xd4/0x210
   ip_local_deliver_finish+0x86/0x110
   ip_local_deliver+0x65/0x110
   ip_rcv+0x17d/0x190
   __netif_receive_skb_one_core+0x8d/0xa0

The window is wide when register_netdevice() fails before ndo_init (e.g. an
invalid name): the socket stays live until pfcp_del_sock() on the error
path. A narrower window also exists on the normal success path.

Drop the packet while pfcp->dev is not yet set or the device is not
running.

Fixes: 76c8764ef36a ("pfcp: add PFCP module")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a backport review.

Reproduced on ubuntu-resolute 7.0.0-42: flood UDP :8805 while creating a
pfcp link with an invalid name (register_netdevice() fails before ndo_init)
-> the NULL-deref above (kdump vmcore). With the fix the same run stays clean.

 drivers/net/pfcp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/pfcp.c b/drivers/net/pfcp.c
--- a/drivers/net/pfcp.c
+++ b/drivers/net/pfcp.c
@@ -61,7 +61,7 @@
 		goto drop;

 	pfcp = rcu_dereference_sk_user_data(sk);
-	if (unlikely(!pfcp))
+	if (unlikely(!pfcp || !pfcp->dev || !netif_running(pfcp->dev)))
 		goto drop;
 
 	unparsed = pfcp_hdr(skb);
