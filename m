Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794700871;
	b=wRoNex4Wq3qbuor6Wmupmrv1qk644GthVUKVxd8NbWupjAcIG4oq6EfH8CwNLUt2AKYW
	 cBdUL4xkB37G4wzo5E190zbIJ/Vcv1QwVtQU+Co/YQ7g1DDw7uJ8rGh94RX2SOKJi9WPo
	 CL0/PzLm5iDyE+P465ko6X+9q944H8pAZRVqBtVWgFEtZTeMCCgSbXFNX29941qAwtDqm
	 oazXHOUWBK/daoqA/BTKJ+fGAb+3JES0uoCAWIMuF9G3Qp9gXFHjnNPNUP4pLIrMQE50n
	 eHoSkZ/OaVPtl6AVyFiR+o9BhkFi9ddcmADgfT4/0jTbiHia0g5x6rL6XMZQv6snASA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794700871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JsG9lkoAjMpLA4+i0YCphibVf/tVMTeDhEOu+z6mj9M=;
	b=kHClLXR/7HWPCkAjPoTxbPAjsbFiy72VP1ZwKNWR82D4cVvGhy529LpWA5lRfpI1FoJA
	 gJbrxBe4dNJyOrTfg0FMoWYxuV2fc3azdHKJnK+D5GFvpRMb1BsnL4K9l6RFG2/nNm4Eb
	 CmxeFdJXYYQlrxaE2gaKjGoYYrZrFqNnbTGBAu+0VojsEhB8q9MsiAb9d6tq6IMoNxIJN
	 0v9R12UJPV7Ka8koMC3tVry1D5tz9cbEdFMre2870Q90cgRTY47NfhZEbKzLpokSlQ7/h
	 1KCCfaho5BcOllwDPNDYm7rz8DXVI9ic80+jA5F7r8NIJ454fKKFAM4JEg+98WkEYzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K3THX4FZ;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38F7D606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38F7D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K3THX4FZ
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so12819005e9.2
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794700869; x=1795305669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JsG9lkoAjMpLA4+i0YCphibVf/tVMTeDhEOu+z6mj9M=;
        b=K3THX4FZXHJzwP07wwzci6B6NEbw5DoH2LG97QH8uTZYJhzrBIqx7AWXQ1zzlSTUr7
         8Atgi4hgekzafTNqFjBqB5RsXChsiBgQgzV+w/LhRdEXDHvWW4TV+5xC5cTCXHL4dX6Y
         RYaHBfZ1CaLCPwdE2JwjH0C8NiZhJfo74kqPFnDsncwRZhSUtYv9LL3aBheqJ1qKYiBi
         CPvv5T4RsQaq/x+YCqAkzjjcLi0MMPLahjIy2s0ZSBUM1f5di0NCkueEDj9Q33Zqqez6
         umAI+mlauPAszpiBhC4IPiMv6JjdMO8tPRSqGCG5HseprJ2hmSWSjziy3tAEv/nPUGxJ
         I9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794700869; x=1795305669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JsG9lkoAjMpLA4+i0YCphibVf/tVMTeDhEOu+z6mj9M=;
        b=wTkyflIRYBKn/2oa4EJpqNN89qDJat4+5n/5i1bGGq7GWDpsi0XjqSs2Ig2onOp0Dj
         g1s+1RimfdCREPSZuIt4+c0fjlCudjcVeQZzFwF2KVKFlj7fXsL/S38CarmeHNbKSEm4
         GjzEh1gX3Bvna+Wfa+8ZDX4TgdQ5spcnAlftYrxWD9Kw6WvClNtXKAkpkj2cBu7f7Hog
         dc3A1Oi4DvJUeoR5tGPomNsINWt3TpAhyBURvaLeEO0qeMPzE8e41L+/NulZWtWYkCPJ
         nIByJN1qquyeG/FRWOl24ZN5cYoYmO5vBluwTYUlVeIvdCrNx6WZtY4WPUCIbsPD0cgD
         oJCQ==
X-Gm-Message-State: APuU4Z82pYsyt7QgiPHDyUVfUBYVNxoqAsyKzOt6yIEg9Wch4C0PSfzv
	jxD+lEXFRC0epV5X4gebqJqjN3Wt/n5Tk1U3cBenYReDevnShMaHnMcG1kQANQ==
X-Gm-Gg: AYBFou3QG9e8qLPG/up/8W1Td2jpUd1jAHGo7N2vZPzjBvibo8fNZKGl3uSProqu43X
	p+dVaJl8mCc4ThrtpZm1NoVzVTpoKUv79sH9E9L4cjQs7a6ByVogJmhztCiqdguSnTOFW7vkOfK
	Ztw73SQ6jfv6zna8018trRvs88ysFK0Xu2WC6VKuDikISpZ24zyPKC5po/ZzuEmQgAZUrgn37dP
	5+qPm9fsOh3FlWS1QShBS/38tdWuaNztXy1boN8a7aFTjryUBEDvA0V1jpolw5122Rp+bNfMaU1
	Q7m4Z77wCggDVz9sGY2sVd4H9DXeKMQTZfTiF+gOKKQpYjBtaR1zJ3EgpNou9QIVCwcBNW4AD37
	vRHHhSDthdZ/ojC4e62YsPTjNA4bJlVDSKVjlMdbex9fYYIAFiDiMGy+ImUYwl0gIJqIPybZxsd
	aKWvCdWTUQH+vMq87YFZ8rc0LMgST2ovAuPTum1IqB+hNsN9oTZbGBplv50lG2gEHI5MIYSZYs+
	Xo/uuz7967aMFw9kHAJkyi2zf9LqMFAn7WvwzHi9NljeSuziKqdDhNU/e6tg+rDrdhx03U0oj4g
	dJwntfVlqwGAbvkaQC5Y0ycF5E265+zIVHtxnmE/LWXa4UC8aQ==
X-Received: by 2002:a05:600c:1d08:b0:4a6:b49f:9ae5 with SMTP id 5b1f17b1804b1-4bb55a898abmr135074895e9.34.1794700869294;
        Sat, 14 Nov 2026 16:01:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:a03f:a75e:9a00:a644:3b4b:4691:92a4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm142366405e9.0.2026.11.14.16.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:01:08 -0800 (PST)
From: Justin Iurman <justin.iurman@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrea.mayer@uniroma2.it,
	justin.iurman@gmail.com
Subject: [PATCH net 0/2] ipv6: drop encapsulated packets when no source address is available
Date: Sun, 15 Nov 2026 01:00:45 +0100
Message-Id: <20261115000047.14669-1-justin.iurman@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Both ioam6 and seg6 (encap modes) lwtunnels select the source address of
the outer IPv6 header with ipv6_dev_get_saddr() when no tunnel source is
configured, but ignore its return value. When no usable address is
available (e.g. none configured yet in the L3 domain, or only tentative
ones), the outer source address is left untouched:
 - ioam6: it keeps the source address copied from the inner header,
   which may belong to another node for in-transit traffic;
 - seg6: the outer header has just been pushed, so it holds whatever
   stale bytes were in the skb headroom.

Both patches drop the packet in that case, like other encapsulation
failures.

Justin Iurman (2):
  ioam6: drop the packet if no outer source address is available
  seg6: drop the packet if no outer source address is available

 net/ipv6/ioam6_iptunnel.c | 11 +++++++----
 net/ipv6/seg6_iptunnel.c  | 26 ++++++++++++++++++--------
 2 files changed, 25 insertions(+), 12 deletions(-)

-- 
2.34.1

