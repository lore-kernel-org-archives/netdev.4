Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795624629;
	b=xbA9xpwxkW2V1Il+CNn8snyVt2x1XNz4SqEZQaNTdpAv7JYHnK33avfRafHAUEpciXfV
	 rxx0hfvK0V9P0mDnRkQUpPoBfrQYrSbDqbN8/pTOfLOc0MQAdhdwBbJFL9sQ5EcR1y+uR
	 r/wjaGQ5UdchEQbaIzkjb6djdRTmT8luOiS4ud/KqLULvVeujGi3X0Zyn4PMzkv2ibPrB
	 R1AFW9eIkF5t8G1ZSR5uSeVTXeC19xAEIOly0NQXn+Uv9SJeoWIwA94/rOU5+jG0SqUK0
	 WkBXiJa41yZealzhAJgozSG6DSTCnpbPzMU+S6o8jZjpfwoJZpOTTDJMN+nNLylc5vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795624629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3bgGou21FxpI4EDMO6qhehKoksRIFoYov0W5b2M559Y=;
	b=u2/2hKFp9Ce7sGpuBAjy9OrJE2hCj94r/tyHOldy6w50o38nENBiG18u8O4elj6+2tIy
	 MbHI38CTHqm9tB9Zyy7FxISfCI4OpDA0k6vYlJzH91l4723vxMQxs22dVd/t+aWFPwzBe
	 ZOekIcfxgRULdSRhy3ygkUsf5HWqJejTyhFWLFS8qe3CzfeLG+3p1Hya9I4ULg8Z38E5R
	 dmR2sohm3wRDfNZ++tj7fmgkOxT840cyChKPj9Q3oGQcPR+cqro9MKlWgrdy+ryTQ4vYu
	 sMQJjB7uhMlTsqAc7g8aKcmc4jOgZhy1O/yAyamlwSogPk12MS1frJW/8QcqpNfSgSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6JHYkOE;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00597606A685
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00597606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6JHYkOE
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cdd9d0c9bbdso3401682a12.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 08:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795624628; x=1796229428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3bgGou21FxpI4EDMO6qhehKoksRIFoYov0W5b2M559Y=;
        b=t6JHYkOEUXxyKZ0B4k95QPq0CFLQBtV9BBIcRe/awPz1hVZ77/HEmpVC7LX/ZPQOBZ
         lDMBRGW6pwTEem749cF6uNfyQA+OldMzM8fLls2BWQ6Bqee0MrRGGWq5fhv8CCsHWUFi
         unRxdhP6LWIX6dPLTpaZdso9PqnR6FbEprK2wHccijRAA4Tv7yXF3BBrdfw+TsUT3z16
         ZI2DCf3exI8MRosluPoqRE0VYoacfIkdblpNzD2zsC2pN4SdQrIPpTNdsVxEqEsQwztb
         tJaKNqM7Zq0SIAjrcAYWcoYXPZ0u347XO+jPBnaIMCwAXSi+E1RomO4l8jQF63QRs3Js
         9CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795624628; x=1796229428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3bgGou21FxpI4EDMO6qhehKoksRIFoYov0W5b2M559Y=;
        b=pZHOkQABwL8yxdSLSfoPm6pxrWZCgbBEBIIixDS4cKoKomfzLraH/cRagp5MTCfBtE
         Kcsglc+l/It3mRCW4kZsRZ6DOv5g/tDo9amJ50lQuw30zJzwffJpM23L3TVRhM0Rc7lU
         8TKWTzP/usD/xeuFHI31BvTL3rhEW5BCyIEpJceCwazrSyEM7tyNPjl+IoflZUp8qqbr
         22cHOh3BR3TciQsVdfX3MDFdZqipxBMzo0ZdOd7hg+47eIK2LrVU+bIo26Uq5ESndp+/
         ZhUufLn74nz+ldIrCnpK6VdiAf3h7G0Gko0Ulw9wOPXvEEY8reuulFRxVN36QultdhAp
         Ookw==
X-Forwarded-Encrypted: i=1; AL+hErFBo0ZtoXb2fqC1hYSTIbZQDthzTF8FnXczfA4ySART/2CetfElJoBBc+iDOKChYLB4xy+ho1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9J+8d+5+fxL6Thuez4ln/SM79OyCu+GwUgwKf0jwZJ75K3dUU9
	eFTh2vdGu29/r1WKAwYTM8vkyBYsvGmH/Tu8DmHEx3lWHUv628ZkXAP/
X-Gm-Gg: AZFdTZc9L+/k8s4N0QYRVlFYNDvj5c3ts8pLDX/Uf8k1U0HDp0tNw6oxR0t0CUO7+Ye
	BLyi9lVDHSOPWaQsz4yjVCpRWW7oE+4rGsECjr78ZgZTRgVPGm0VG0Q7Y5yArgIEgbv1VFuPSkt
	ArQOwEmVaFQGRLlFrBfb2Mx0ghMQw+9OX41Cd3k72UA1Ykf8m4lna6FMFg3wPLGC0phaj8PGrSO
	DFdnXYpZnUVxiu1KGg45pljsfR8YUgBirqV2hR1HE0aT/GxB/YsKt01UHrbP7fAm9mBqQ7/59It
	egkMFdcQ/K0m4g9vpnuwUQn6wyXdHA9pHI3PTn9NFmRHHNp8z8QFx9kaIRUU2AaoZkT4cdhniGn
	zblqyf0zQnixDZ1M0cytEoIq9l0Pk1eVka38ph7Ee4lHsGPNdP1Q6aRjlPWlEabEjlVDU8VIPid
	aPAtfFdD/3iIOklEwikgzqBedHVKV4eeqWPbKzQkwAZDK9ger03DvOA5jz5aAW20ZE2LhH/3ijt
	WHzJK8pht0Ao6dAgVLOrS5HhasUSQHLB767J6DUOmvpSgBdbNpbW83my/sLwJMrkDscccWgZpoc
	iwuL44mD+3lwpZcCeJyhcR0vgrs+ydwlEUHF2BsdmPA0vGnL/s8AVrovLY8pOVi23u0=
X-Received: by 2002:a05:6300:2209:b0:401:367e:c5f with SMTP id adf61e73a8af0-4014ca44812mr19684662637.12.1795624628152;
        Wed, 25 Nov 2026 08:37:08 -0800 (PST)
Received: from d20be28ee783.tail196be.ts.net (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm8895570a12.21.2026.11.25.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:37:07 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Stanislav Fomichev <sdf@fomichev.me>,
	Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	netdev@vger.kernel.org
Subject: [PATCH RESEND net v2] vlan: drop the promisc/allmulti references on the real device on delete
Date: Thu, 26 Nov 2026 01:37:04 +0900
Message-ID: <179562437889.3453587.11037378125876087336@gmail.com>
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

Since commit 27b918007d96 ("net: vlan: don't propagate flags on open"),
vlan_dev_change_rx_flags() passes IFF_PROMISC and IFF_ALLMULTI changes
on to the real device whether or not the VLAN device is up, and
vlan_dev_open()/vlan_dev_stop() no longer take or drop those references.
Nothing drops them when the VLAN device is deleted, so the real device
stays promiscuous or allmulti for good:

  ip link add link veth0 name vlan10 type vlan id 10
  ip link set vlan10 promisc on
  ip link del vlan10
  ip -d link show veth0    # promiscuity 1

Drop them in vlan_dev_uninit(). The device flags are still set there,
and no instance lock is held, so this does not bring back the recursive
locking that the commit above removed.

After that, stop passing flag changes on to the real device. When a
VLAN and a VLAN stacked on it are deleted in one batch
("ip link del group N"), the upper VLAN's vlan_dev_uninit() can run
after the lower one's and clear its IFF_PROMISC or IFF_ALLMULTI, which
would drop the real device's reference a second time.

Fixes: 27b918007d96 ("net: vlan: don't propagate flags on open")
Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
---
Resent with netdev and the other recipients in Cc; the first posting
reached only the four net maintainers (Paolo).

v2: stop passing flag changes on to the real device after
    vlan_dev_uninit(), so that a VLAN stacked on it and deleted in the
    same batch does not drop the reference again (Sashiko,
    https://lore.kernel.org/all/179561249161.3135.16028121153100336999@kernel.org/)
v1: https://lore.kernel.org/all/179552079831.1290967.13072162433438626338@gmail.com/

The issue was found by an LLM-guided test generator that we are
developing as a research prototype. The commands above reproduce it as
any user under "unshare -Urn", after
"ip link add veth0 type veth peer name veth1". With only the
vlan_dev_uninit() change, a batch delete of two stacked VLANs wraps the
count instead:

  ip link add link veth0 name v1 type vlan id 10
  ip link add link v1 name v2 type vlan id 20
  ip link set v2 promisc on
  ip link set v1 group 5
  ip link set v2 group 5
  ip link del group 5
  ip -d link show veth0    # promiscuity 4294967295

Our test also covers allmulti, a VLAN that is up when the flag is set
or the device is deleted, and the stacked VLANs deleted one at a time.

The patch was written with LLM assistance; we reviewed and tested it.
With it, both counts return to 0 in every case, with lockdep enabled
and quiet.

 include/linux/if_vlan.h |  2 ++
 net/8021q/vlan_dev.c    | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/linux/if_vlan.h b/include/linux/if_vlan.h
index c863cdf60f01..c0cfb87d6682 100644
--- a/include/linux/if_vlan.h
+++ b/include/linux/if_vlan.h
@@ -168,6 +168,7 @@ struct netpoll;
  *	@vlan_proto: VLAN encapsulation protocol
  *	@vlan_id: VLAN identifier
  *	@flags: device flags
+ *	@uninit: the promisc/allmulti references on @real_dev were dropped
  *	@real_dev: underlying netdevice
  *	@dev_tracker: refcount tracker for @real_dev reference
  *	@real_dev_addr: address of underlying netdevice
@@ -184,6 +185,7 @@ struct vlan_dev_priv {
 	__be16					vlan_proto;
 	u16					vlan_id;
 	u16					flags;
+	bool					uninit;
 
 	struct net_device			*real_dev;
 	netdevice_tracker			dev_tracker;
diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index bca0a3693636..401ae08f16f4 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -520,6 +520,8 @@ static void vlan_dev_change_rx_flags(struct net_device *dev, int change)
 {
 	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
 
+	if (vlan_dev_priv(dev)->uninit)
+		return;
 	if (change & IFF_ALLMULTI)
 		dev_set_allmulti(real_dev, dev->flags & IFF_ALLMULTI ? 1 : -1);
 	if (change & IFF_PROMISC)
@@ -647,6 +649,14 @@ void vlan_dev_free_egress_priority(const struct net_device *dev)
 
 static void vlan_dev_uninit(struct net_device *dev)
 {
+	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
+
+	if (dev->flags & IFF_ALLMULTI)
+		dev_set_allmulti(real_dev, -1);
+	if (dev->flags & IFF_PROMISC)
+		dev_set_promiscuity(real_dev, -1);
+	vlan_dev_priv(dev)->uninit = true;
+
 	vlan_dev_free_egress_priority(dev);
 }
 
-- 
2.43.0

