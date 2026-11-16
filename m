Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794811972;
	b=wb+ItFhZvD/g/aHkHRluV+CjcBzRNE94M2ZDlGDtS5Q2E0gZ6RimvtwhmXiMtOYKUGJH
	 lvT5nKEeUSv9MYWwSRztWAf9h6C2vOpbJVfmtYij8YeghdEk7k7W6o5E9OiTEPVPnmQ90
	 CK76PqRHT6mPTgqbrOHdVMBlhxQtqo5dmuejukbqxZRzawU/TO0PUN4muz5xV2MgY0BxC
	 SSjyRA3TO3WwI7cLOr9kkZBqDNMa1Egg9R5aV4rcCnE81HlJuObswB1UvutwQkUdDGeLh
	 qbYAboS+Qqw2UCJgBB87XZzSs8PSfaBO+Pu4akCiyhiAkSsDxTg21ibrSgfvr/Xkong==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794811972;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cjhcJXXCSoPUURtlLlIneNXvDxbgE0VczhsVYg4OWeA=;
	b=durqIGX9ziK4OsMQqhGrkvTdfeyNsxJeDJms2YvfywRWU8gdRcu4/YLvpn5AqQEu57vs
	 eth8TYUF7dxF96eFlDAsmaWgWyaSpyVoRn/a6dsiiA4zs4ImZJ5PH6Uz9elCUhLJK8U6J
	 n52qojgsKi5jFqxt2JsIa4Z7K5cqG8IaJ6YM0/VWUz8yohdbmcJtf1glJJK8v2ybJOVO5
	 fgHlTwh6lGkLlo/i+7U05QYXnEvIpB1Tp+PqixwqsowRc9uXrCLntD7gLavtIhascdt/B
	 lEhWjkG8Bu+q8ZPiBKaKFQ7U6iqXpbV+VFv4AyTINMbPI6mYwy9tDDpV7S2QZF4GVVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3H+UGzl;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E990606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E990606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=q3H+UGzl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so17861235e9.3
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 22:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794811970; x=1795416770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cjhcJXXCSoPUURtlLlIneNXvDxbgE0VczhsVYg4OWeA=;
        b=q3H+UGzlRUdmWHbUPd7t3HR5eKwNDbaFWW84LlpilKC0Bmwf+p8Qj822BX83el6jq0
         x97fSwmaPxrNovwx7gS79U6KbORn8lKnRVysFSFqxpm6Q0NWG5V0gm2gN025OB4hAx0U
         MxQRjIpSJ9RYdqEbZ6nNKCuD0f4TA2h2nssetnqFFnQ3+uLZ/eByv1m5s1MQ4ZzJB1nn
         27rKZDqHMauhvfY2iHIWBRxfdArVVwjBmh1AvkauVXRu3PzvtyPsuVHQkryoYcP2kVk8
         ov5YzEupC6YOSRgvymDeHVgQ2vU59tY7GHqk6QOGNW78yk2qVvb6ytRx8gcL0rF0zsFR
         VA5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794811970; x=1795416770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cjhcJXXCSoPUURtlLlIneNXvDxbgE0VczhsVYg4OWeA=;
        b=1Bg48cIw7yyRLYp5T3XLMyZcQgAh0wE26E9CwK2b+wniMoOsqsK1ZyGlgsuXozUOn0
         pXAmjaHzGQNRwWJzTdmjnnqFrezQZM+O/rMFOT0mJisfLA2iDxGAtMZtB0Zijzgl7AUB
         vFboJchSB74bmEeibNKemtTfxuPuw4wOcjI1cNoIwHYNfZZlG2Gf5qdzgXnCaVDtUvI0
         XfaUr/Dw4d6RwOF7dAf0Z83qsluqZW3Pas7fil/7nDC+quK3me5Mh9gJsrhlFlNIx80L
         MZADGJ8S7CHj8Lyx9SF6Ff+wNNYitDa7y/SrSi7T3WEcJ3R4TGh9Oxmr3TGz//E8poaP
         yh6A==
X-Forwarded-Encrypted: i=1; AL+hErH74IV8GPWKPPirEoLFD/zYuhNmYxe0h5dnyJhywvKEkMLzOMWLNJ3HJnJ45jdpjYY3MoaZtSo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uCBiWVkj3z9d+8gbQZs7P9R2KAN9wcdNQkBNNVvFyomZtNXQJ
	hNUEm7RF5+KlGdewuz5l25+i2Wl+uDFYOMmF4r1hVQM6S/fIzNMSd6TX
X-Gm-Gg: AYBFou0TUemwksQq6VFRFo5wiZZJs1d3qeLC3SDWojHFTRf0bfeCW3DhOT8Ql2dHeJK
	Nc2r533yiLp23udSQMJQnFKmoP66lJ05CZ3Q/gOMPZ5x9Tr1s9KZnsaCJlB4tbF12g9/6McOopY
	c9Druh65ydklKVo3VEHmcScipBSBhbTjya6WVOUIrk/+imgH4avMj1ZEkBhTyOxDvcBPZyQLmvI
	iJubk4viEX7XgGwqnikJZ88lNFIk1n1AA+LZTOTqS/cYUvvnUdSIY7A+4dv+or0PWeKeNWy4B5n
	T5Idy1bj7HLV/3fPD4nGvFTgvyuFXFfrL5IHOP0ZHqqMfFl8LXJEehk80myVkFiAZeos+Ae05mG
	qefaC6ls+DYtK5OcgC/b6LeShIQfUrFNEadssqZmkvRQMBulZtDC/SywhAh96Y9i7KJcvJpGR2A
	sMfN1pOXiJ+2y1XxnwVAz0JKS0wd8dwBBlX7sUFiOm/dfGtHrb0Ir7qdjw67zvcwZfZNRjP4r2i
	erWAzomxCZFHt4zBQRNIupCt1vrAEtQc6pSU+SmXCyLGGFsMRDNbb2NOAjjoBdw2Bp4lN2QHKv5
	DKbFOstqUFZWApxN/2jR
X-Received: by 2002:a05:600c:8b4c:b0:4b7:6b96:e431 with SMTP id 5b1f17b1804b1-4bb55ab56ffmr208709665e9.28.1794811970223;
        Sun, 15 Nov 2026 22:52:50 -0800 (PST)
Received: from fedora ([5.131.7.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6caae30csm86848945e9.2.2026.11.15.22.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:52:49 -0800 (PST)
From: Petr Vaganov <petrvaganoff@gmail.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-wpan@vger.kernel.org
Cc: Petr Vaganov <petrvaganoff@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Phoebe Buckheister <phoebe.buckheister@itwm.fraunhofer.de>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	stable@vger.kernel.org
Subject: [PATCH net] mac802154: remove redundant security_enabled assignment
Date: Mon, 16 Nov 2026 13:52:34 +0700
Message-ID: <20261116065235.27348-1-petrvaganoff@gmail.com>
X-Mailer: git-send-email 2.55.0
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
 x64_sys_call+0x12a8/0x3cf0 arch/x86/include/generated/asm/syscalls_64.h:308
 do_syscall_x64 arch/x86/entry/common.c:47 [inline]
 do_syscall_64+0xd9/0x1c0 arch/x86/entry/common.c:78
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Commit f30be4d53cad ("mac802154: integrate llsec with wpan devices")
introduced mac802154_set_header_security() as the sole function
responsible for enabling frame-level security: it sets both
hdr->fc.security_enabled = 1 and initializes hdr->sec together,
maintaining the invariant that security_enabled = 1 implies hdr->sec
is initialized.

However, ieee802154_header_create() was left with a pre-existing
assignment:

    hdr.fc.security_enabled = cb->secen;

This assignment can set security_enabled = 1 (from a stale cb->secen)
even when mac802154_set_header_security() returns 0 without initializing
hdr.sec, violating that invariant. ieee802154_hdr_push_sechdr() then
reads uninitialized hdr.sec fields.

The stale value in cb->secen arises from a specific setsockopt()
sequence: calling WPAN_SECURITY_ON (secen_override=1, secen=1) and
then WPAN_SECURITY_DEFAULT (secen_override=0, secen unchanged at 1).
This undocumented combination likely explains why the bug was rarely
triggered.

Remove the redundant assignment; mac802154_set_header_security() is the
only correct place to set security_enabled.

Found by Linux Verification Center (linuxtesting.org) with Syzkaller.

Closes: https://syzkaller.appspot.com/bug?extid=60a66d44892b66b56545
Closes: https://syzkaller.appspot.com/bug?id=23f21e76e9d2d1ed587cb5e71515260d6d025b63
Fixes: f30be4d53cad ("mac802154: integrate llsec with wpan devices")
Cc: stable@vger.kernel.org
Signed-off-by: Petr Vaganov <petrvaganoff@gmail.com>
---
 net/mac802154/iface.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/mac802154/iface.c b/net/mac802154/iface.c
index f437b8daa00d..7b7332805ecc 100644
--- a/net/mac802154/iface.c
+++ b/net/mac802154/iface.c
@@ -368,7 +368,6 @@ static int ieee802154_header_create(struct sk_buff *skb,
 
 	memset(&hdr.fc, 0, sizeof(hdr.fc));
 	hdr.fc.type = cb->type;
-	hdr.fc.security_enabled = cb->secen;
 	hdr.fc.ack_request = cb->ackreq;
 	hdr.seq = atomic_inc_return(&dev->ieee802154_ptr->dsn) & 0xFF;
 
-- 
2.55.0
