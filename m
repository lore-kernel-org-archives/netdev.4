Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795164352;
	b=Eu/M25QB+3i9wHgq/8AwyvCrHp5DARQLGb141OTfSbm+TSxp28BnaG6g76WrHjZLoSmy
	 VQ4+wdf0z9O4DYOSjuVxdThkulT0SIp5OCEV/Uz/WV6S8+mDM4eEpOPjeybZI2G8mUcTA
	 2B+RhmyfMoXWHSO6S3lJCZSHpeopu8dp2y4G59gSPR3H59hdcjvEF2x4sDWPZkKctInjq
	 i4CYVHMJgSiotds0LphAuJlnzrvTJKuKUfMryU83U/qRA6/NQHIYKWvgftYFPd55t0U2b
	 QmOIbloLbvoj6d0C4G9HhRL67mRJujzc8E/ZlrtuDdyrWsshoaW1wfP/tuBNU7y/ioA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=h9SZ7oit3rf7L0k3/vYhwQ/SCR9NX7RR4atVgmcpOZI=;
	b=lKUMAgwMYkzjlN86zerQ0cMDKFyVFAUiCA0wPsyekDU6b//CVMx2CqQsiQqz6QNxCsEZ
	 z39dNCQg40mUeGAWnmWGc0Y4mHhyQSL32HQVUFwJrbN604aB3vi5tlcKfp/gim/VuWDYY
	 eklsimWPzl+CZ5qcUefOmZGODzZJQo/fGBsNLIWe6FxiFo6G47MH52m57uVxXMYJF1Erf
	 AWtlCKlPzE/dGSthuw1/wrMi92DwM6XtaVfNd6/Qk6flF9ShieR8CWOrWIH9WXThK1GHI
	 ZAus+A2aPTtxaMXA8cyJNq6h/cZhcs+pAYKEKIToHjf4mG0/XztcxcO8AZtxR6GyvBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nDDetwm1;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01988606B4AF
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 08:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01988606B4AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nDDetwm1
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490f38e9688so413285f8f.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 00:45:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795164350; x=1795769150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h9SZ7oit3rf7L0k3/vYhwQ/SCR9NX7RR4atVgmcpOZI=;
        b=nDDetwm1tmYlMjIVqJLFKe1gaSh6r8MNX4r1kvlThsCDDkBwuBVMVnrnJ/9qdLgDtE
         wVNIjFvU7Kxre4hSpD8jh1Kb5DQvH4wHzgZN51j5IEytJMI2UmY0/cWa/4FjXnupBUA2
         7YMnQDq6+0OBtxcA5AL0LkXP/wpdGCJAKgM553Bxf9uGVIH9Jo6eNBD28xOkQKj5z59b
         Hpf1OYgcmfTFphqf2487tJwRHtRLXR4RJygNt+PyX5Uil9E5gsQ30v7usfG3oqXkX/NZ
         98RmZaZTsfjcHnAc0YFAqRXJ5j+zXPKqVtGBgPovml7Fs9Fxv3JG2sfz/giagTj4Dj08
         Rzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795164350; x=1795769150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h9SZ7oit3rf7L0k3/vYhwQ/SCR9NX7RR4atVgmcpOZI=;
        b=AK04zNSdhgroivjIT0YsnArnhNQydrkWtZEkzeunI8WxWuV1gPYZxjLLbum6aPiyA6
         3p/MkBeS9k2c2T10SlWXH8x7jKQSlhJ7MF1IIuA53IoaBI5nAaaOC4EIp4AX3wuHlqkh
         HPpnTpEyv3uEL7IBAqg9dFF10MmAE56irpx0oZTJ835rH5TRJmmQbLjWR2KYCPs6Nox9
         YqKqpJ0ZDCoGffgsd4GFrpuyf/Kaky/bVKbGpUZB7dkczjZrFZbVM0WqCEg1kDcMDWEk
         3gv/ZojM4phCoUes7ReAW32bvp6D7GF8Nq+IfxhQ4+p7iNjbIGGr/x2eUaveOsbUypy1
         wrfw==
X-Forwarded-Encrypted: i=1; AL+hErFBkviCH25mpqG9KePVUwwkMtm0i8FI+S/yKDKOfGm0/9rjZ2SgC5m+Cnr8CrfCoRO/eyOR7wY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uvFchMSRiMR3AI/Coh24ez0BBeDcRlIjSXyUCwFzKPe5KgYiT
	9OAlay9b3LTx8dfi7yuprYnyjrYUUvrV0EXsGuX1YzwHcZnF715s+rAw
X-Gm-Gg: AZFdTZck+j3O442+KTiwPbLPYcV0on605SPhF2clZylO9dhy3Gg70vTpN8fi43HJNWN
	j7rD0iRHrf5wBklTgniDt6DCLCDMFrFudaPalKCf0ldOshxA80ckI3F4nExwN4xxir9hQMVX1GT
	+fItXRQZQlH4h2FmSE1faaodvpwjyiwUERF2daAYY6FXP464Hnnd7WIR1a5XxQ1NHTat98z+KkI
	NQ6K4Z3hyGPPEs1+p7mZu86ntCjTFovAh3bQmVQsFwecGAaBRLRIiXMJNLdh9sdWVZUMEB6FALL
	n7jbpEMl9NIMVE8KiLrFXjKHQnOO+uQSBF5jcE/jloZg7THsG31c0paprUNR8T4KXh//1JcFMZ0
	jUSH5RtUf/AL1rwXg/WC5/DIGc8Hzg188nQG6N0qbhMMok6b2rxylvouaNTICntVlWfRHn0ieqm
	FbxFpAd5tCC12y/A4wQKooMdyX9VGywPvoWj/xu0un4c/xY+Ph5j/viLHqebId3vDAFHIBro1H4
	0yMIQ1we40dyJitVwgcaC9jHBW89duG8Dk5M23R8sde6+5GGa0rmXPf3crEt4jx7U2oSh0B7HZh
	J/l7oMPCtk9W81zMhShSng==
X-Received: by 2002:a05:6000:2288:b0:4ab:1d39:92cb with SMTP id ffacd0b85a97d-4abab6de737mr3978948f8f.2.1795164350141;
        Fri, 20 Nov 2026 00:45:50 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb41f4sm4121178f8f.7.2026.11.20.00.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:45:49 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: alex.aring@gmail.com,
	stefan@datenfreihafen.org,
	miquel.raynal@bootlin.com,
	linux-wpan@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	phoebe.buckheister@itwm.fraunhofer.de,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Petr Vaganov <petrvaganoff@gmail.com>
Subject: [PATCH v2 net] mac802154: fix uninit-value in ieee802154_header_create()
Date: Fri, 20 Nov 2026 15:45:37 +0700
Message-ID: <20261120084537.31991-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116065235.27348-1-petrvaganoff@gmail.com>
References: <20261116065235.27348-1-petrvaganoff@gmail.com>
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

During fuzz testing, the following issue was discovered:

BUG: KMSAN: uninit-value in ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
BUG: KMSAN: uninit-value in ieee802154_hdr_push+0xa62/0xb20 net/ieee802154/header_ops.c:108
 ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:54 [inline]
 ieee802154_hdr_push+0xa62/0xb20 net/ieee802154/header_ops.c:108
 ieee802154_header_create+0xa83/0xd20 net/mac802154/iface.c:396
 wpan_dev_hard_header include/net/cfg802154.h:525 [inline]
 dgram_sendmsg+0xc6d/0x15d0 net/ieee802154/socket.c:677
 ieee802154_sock_sendmsg+0x8f/0xd0 net/ieee802154/socket.c:96
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg+0x2f3/0x360 net/socket.c:726
 ____sys_sendmsg+0x960/0xc30 net/socket.c:2581
 ___sys_sendmsg+0x285/0x3e0 net/socket.c:2635
 __sys_sendmmsg+0x33c/0x950 net/socket.c:2724
 __do_sys_sendmmsg net/socket.c:2751 [inline]
 __se_sys_sendmmsg net/socket.c:2748 [inline]
 __x64_sys_sendmmsg+0xc6/0x150 net/socket.c:2748
 x64_sys_call+0x12a8/0x3cf0 arch/x86/include/generated/asm/syscalls_64.h:308
 do_syscall_x64 arch/x86/entry/common.c:47 [inline]
 do_syscall_64+0xd9/0x1c0 arch/x86/entry/common.c:78
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 ieee802154_hdr_push_sechdr net/ieee802154/header_ops.c:51 [inline]
 ieee802154_hdr_push+0xa5b/0xb20 net/ieee802154/header_ops.c:108
 ieee802154_header_create+0xa83/0xd20 net/mac802154/iface.c:396
 wpan_dev_hard_header include/net/cfg802154.h:525 [inline]
 dgram_sendmsg+0xc6d/0x15d0 net/ieee802154/socket.c:677
 ieee802154_sock_sendmsg+0x8f/0xd0 net/ieee802154/socket.c:96
 sock_sendmsg_nosec net/socket.c:711 [inline]
 __sock_sendmsg+0x2f3/0x360 net/socket.c:726
 ____sys_sendmsg+0x960/0xc30 net/socket.c:2581
 ___sys_sendmsg+0x285/0x3e0 net/socket.c:2635
 __sys_sendmmsg+0x33c/0x950 net/socket.c:2724
 __do_sys_sendmmsg net/socket.c:2751 [inline]
 __se_sys_sendmmsg net/socket.c:2748 [inline]
 __x64_sys_sendmmsg+0xc6/0x150 net/socket.c:2748
 x64_sys_call+0x12a8/0x3cf0 arch/x86/include/generated/asm/syscalls_64.h:310
 do_syscall_x64 arch/x86/entry/common.c:47 [inline]
 do_syscall_64+0xd9/0x1c0 arch/x86/entry/common.c:78
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Both ieee802154_header_create() and mac802154_header_create() declare
struct ieee802154_hdr hdr on the stack and clear only hdr.fc via
memset. This leaves hdr.sec uninitialized.

There are two ways uninitialized hdr.sec fields can be read:

1. ieee802154_header_create() had a pre-existing assignment:

       hdr.fc.security_enabled = cb->secen;

   This could set security_enabled = 1 from a stale cb->secen (e.g.,
   after WPAN_SECURITY_ON followed by WPAN_SECURITY_DEFAULT), even when
   mac802154_set_header_security() returns without initializing hdr.sec.
   ieee802154_hdr_push_sechdr() would then read uninitialized hdr.sec.

2. mac802154_set_header_security() never writes sec.frame_counter.
   ieee802154_hdr_push_sechdr() copies it from the stack into the skb
   before mac802154_llsec_encrypt() sets the real value. If encryption
   fails, or via AF_PACKET taps in dev_queue_xmit_nit(), the
   uninitialized bytes are exposed to userspace.

Fix both issues by replacing memset(&hdr.fc, ...) with
memset(&hdr, ...) in both functions, which zeros hdr.sec entirely
before mac802154_set_header_security() is called. The stale
hdr.fc.security_enabled assignment is also removed as it is now
superseded by the full zero-initialization.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Closes: https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
Closes: https://syzkaller.appspot.com/bug?id=23f21e76e9d2d1ed587cb5e71515260d6d025b63
Fixes: f30be4d53cad ("mac802154: integrate llsec with wpan devices")
Cc: stable@vger.kernel.org
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
Changes in v2:
- Replace memset(&hdr.fc, ...) with memset(&hdr, ...) in both
  ieee802154_header_create() and mac802154_header_create() to also
  zero hdr.sec, closing the pre-existing uninitialized sec.frame_counter
  read on the normal TX path (noted by Sashiko AI review).
- Rename subject to reflect this is a bug fix, not a cleanup.

 net/mac802154/iface.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index f437b8daa00d..36bdd7558810 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -366,9 +366,8 @@ static int ieee802154_header_create(struct sk_buff *skb,
 	if (!daddr)
 		return -EINVAL;
 
-	memset(&hdr.fc, 0, sizeof(hdr.fc));
+	memset(&hdr, 0, sizeof(hdr));
 	hdr.fc.type = cb->type;
-	hdr.fc.security_enabled = cb->secen;
 	hdr.fc.ack_request = cb->ackreq;
 	hdr.seq = atomic_inc_return(&dev->ieee802154_ptr->dsn) & 0xFF;
 
@@ -433,7 +432,7 @@ static int mac802154_header_create(struct sk_buff *skb,
 	if (!daddr)
 		return -EINVAL;
 
-	memset(&hdr.fc, 0, sizeof(hdr.fc));
+	memset(&hdr, 0, sizeof(hdr));
 	hdr.fc.type = IEEE802154_FC_TYPE_DATA;
 	hdr.fc.ack_request = wpan_dev->ackreq;
 	hdr.seq = atomic_inc_return(&dev->ieee802154_ptr->dsn) & 0xFF;
-- 
2.55.0
