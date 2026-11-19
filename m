Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795109060;
	b=mWBGVEjrq2nm6u1hw6bxyhkNlSwhhcLNSOAem1zMyuIm9T5zI7rdHr/XTec776opbkDx
	 1nIRFw4bV26KOlT5tKfhSsnbdOnvoIEJ9uSTHTtj+Cu+dHW75PenSMkQb7GMRYBQQ9AtA
	 I4OjMDGO8yK3zfMKSJcq3QJcL9gC8qNqOPw+A2JBIT/9cdIsY1N4W2reBp+Y5gk3Emgqn
	 h7izWOA82l13wsHH38s+TaV4VcyUe7r8rYIKHpbUP7hurY61RnB4aAP26ajK+1nOAdZk3
	 zmBAMD8YWGVcPUOaHi9Ln1+TETUSt/9Ilm/yo/7WVxuft3Rh/MonVGLnuwURWieRwLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795109060;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ybt3yDy2PVnBctTda6fFNeBbSLRMNED8RLSC/2nr034=;
	b=IzjndGImQj2gLYL22v42/372rELi9LSWKPeYwMExkflcH5Bytk/YFffGpxrWnaPfqv2J
	 uLBFYmonZskLVMekg+u2mXbdwNl4lX0aQjgz72PvKykcUY+J6fQX8Uw3ku1J3e8WnIcR2
	 o5lQOhdeW498mIGf4yFXXOnFEDzQ4h46autLFO73stC7V+g/M0Orc6965YWvdmWPzALhd
	 AI5o3wdchNnSrbDwVn12wXFj+ufT+Mjo6mxTrZQbEGWh7gv1gNC9SNLy7kkZfgXxQnhS3
	 FeNhfpqWgQetldPnnyKZ+ALQgiYFdd+fueDAlzignGAsb+EDg3dSyvCI8ZV/eUH+zTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=jD9NsWHE;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4F9606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:24:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E4F9606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=jD9NsWHE
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso34976045e9.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795109058; x=1795713858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ybt3yDy2PVnBctTda6fFNeBbSLRMNED8RLSC/2nr034=;
        b=jD9NsWHEcpatdmkdARhiuKvJF8rOijuHu4QsWe5pwXO/hCwFJt23oZzBSkW3RxE3ez
         HDXmr6cRmfsFwFAy8r5Gefm4/JTb+2WilSA9p9UYjvMupIOWW1BllrzQEBEzdPIpMkYa
         nsfL0+2xw5a48YGHj/+hdypYNNqC7vSWdCFI9Qul2FiDvBK/Pho/QdDVUQT2EXExT3EW
         0X2SSGfyKL4Jkka9NRhr087wMg13s/LtvgdBfHGc5GsHxeU+emJgMhKeL5rvyCcxEubZ
         C3REhaiwrUacIb5LugvECbYId2qVh99ulNcHvTXm4iuN/eHRaxfANYmx8W+w3CtthPW9
         l2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795109058; x=1795713858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ybt3yDy2PVnBctTda6fFNeBbSLRMNED8RLSC/2nr034=;
        b=IsBDjLUswSctrBRJLZAMsQ0HkyT1w7PIsIM0mxWQe4hPEKLbMY47auO6CrliJ2u00H
         97k5R4DDLJi+SsQU/Z4h1aseMDK2Jyxe/PB6h/GOAV4prORK952HGbV4ZKE7JVleXHp/
         q1edH+/Lf0kder08KDn71H2gn3aMtTKwXM86f+S0J9qpjf9qywt1cBYpnqdD/eQ+Igzd
         bmjxP/2/f/sYZ84TsodsEcmUh4YIi31m+ussjensM+/LyKWmpkEyXUuAVvnbCaDhOXgR
         bbd+3xFZRChrzlX1dPzJ95c2dNf8fgP9wmmbS7NOWbvxs6elb61+VDTpPee31+ooFkKP
         jyZw==
X-Forwarded-Encrypted: i=1; AL+hErHfB7EBJSbZtw+xAaU24VZKVO8R5Abb5i9+qwzDOwKRg62suHhL6EmQ/GPWSz2dniSZ9TJXLjc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E4o85draOjYkGrGez1b2gJ0QuKpym8AJcqownOwV3BShd8k75
	fIEbTbMN8UgVXJH562r7cPP11oQ0p2pxxzg0sm8qrHUmSETnNn9577chPy76sQOeub8=
X-Gm-Gg: AYBFou0FRYFeDoejbLgWsyREcQIPcikC75qwhf+4wjQhc0KursNAECDc1M4qk2XaTQa
	GgArjowORgfDKOsa+YLnH0gXHJSvWTo2ZLMJHNuK2FfrjcZRkNHVemnPGkbRygLDR4kDH4IdnOR
	PGz9h0HzB9lpkshcTfCVT+TiWuSH6DkFs0FH3cKDA8jNluRfaIBTvT3DvjWhvrLjS6mZDeg44ls
	Cb82LHjyrLLzl29o9hlugNjujy0hozs52CUKwkY724bTcUAwuHo0jAEdJ7uTjJhXsAh+yZ/CHn4
	PJ96srxh1tWH+icDICZ9JBrKqpQGNvCMLDbpYnNNW4YhzrWqhmrVhehg5Df6tbC18gwphaugvwB
	opiwabdqQgb/iZJrXf6K8pwUE3w8A0l6M80vPp0sMlouvjgO6XTHnFeo43Awe1Jp728cI5Lk5E3
	X0xBeD46JhcHpgsFiLA6zflH3SG6POWJKRONEZebc53T5Ag5s/IEPl31Guw+hBVUZyB0Gb57qrX
	huDn9CHH+7aOh589CjJjAjo1b/m27UjHEpCNlP6mg9Eqf4H+l2ZZfdRH3WyrVSEzr+m+x24KGNS
	UvnEeOej/TMmUwnifuMAZngk
X-Received: by 2002:a05:600c:34c9:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4bb88810d28mr4268105e9.18.1795109057952;
        Thu, 19 Nov 2026 09:24:17 -0800 (PST)
Received: from dev1.kernelcare.com ([2a01:4f8:172:1c85::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b8429sm17951085e9.14.2026.11.19.09.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:24:17 -0800 (PST)
From: Andrey Misiurov <amisiurov@cloudlinux.com>
To: Alexander Aring <alex.aring@gmail.com>,
	Stefan Schmidt <stefan@datenfreihafen.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-wpan@vger.kernel.org,
	netdev@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andrey Misiurov <amisiurov@cloudlinux.com>
Subject: [PATCH net] ieee802154: keep the original error after a netns rollback
Date: Thu, 19 Nov 2026 18:24:13 +0100
Message-ID: <20261119172413.2068073-1-amisiurov@cloudlinux.com>
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

cfg802154_switch_netns() moves all of a phy's netdevs into a new netns. If
one move fails, it jumps to the errout label and moves the already-moved
netdevs back to the old netns.

That rollback loop overwrites the same 'err' variable with the result of
each move-back. The move-backs succeed, so 'err' ends up 0 and the function
returns 0 -- success -- even though nothing moved and the phy stayed in the
old netns. nl802154_wpan_phy_netns() then tells userspace the move worked.

Keep the original error in a separate variable and return that.

Fixes: 66e5c2672cd1 ("ieee802154: add netns support")
Signed-off-by: Andrey Misiurov <amisiurov@cloudlinux.com>
---
Found during a backport review.

On debian13 6.12.88, "iwpan phy phy0 set netns name T" reported success
(returned 0) while phy0 and its wpan0 interface stayed in the original
namespace; internally the move had failed with -EEXIST, but the function
returned 0 anyway. With the fix the same command correctly fails
with "File exists".

 net/ieee802154/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ieee802154/core.c b/net/ieee802154/core.c
--- a/net/ieee802154/core.c
+++ b/net/ieee802154/core.c
@@ -222,6 +222,7 @@
 {
 	struct wpan_dev *wpan_dev;
 	int err = 0;
+	int ret;
 
 	list_for_each_entry(wpan_dev, &rdev->wpan_dev_list, list) {
 		if (!wpan_dev->netdev)
@@ -249,6 +250,7 @@
 	return 0;
 
 errout:
+	ret = err;
 	/* failed -- clean up to old netns */
 	net = wpan_phy_net(&rdev->wpan_phy);
 
@@ -264,7 +266,7 @@
 		wpan_dev->netdev->netns_immutable = true;
 	}
 
-	return err;
+	return ret;
 }
 
 void cfg802154_dev_free(struct cfg802154_registered_device *rdev)
