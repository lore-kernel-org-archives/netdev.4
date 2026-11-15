Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732866;
	b=vmxkG95vgxNJw5djFNY9hjs0EGtK8pPnsOIHlhGILceW2w9MJEzo68CgS3RGRAzeG2TE
	 mi0LpIqDAPpAlYI1b9vv4k1JGlXzbtaE7lY962/wCXcnyhe8grvxMMx2sy3kH9Dgrf9Pv
	 lZNnttleT7Z7fzgeSxtLiFJUzN3R5NuTUMcy2duNo4lZUSribEGXbrH3yzkW3aL/F9rIU
	 xBS5vOX2JCz2dLddjqc9ORvNqOgRZmlcN0o3/kv+UwkqykkSgqA/prp3m3M2ShnxiKE6l
	 tGWnVOUliLGC6Go6RSfwBV0zZqxGT54yo+zlxXtFHogL9uovuLw1Jwx2kreToHewXfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732866;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tNFwIny9vR4/dtjp+ZSTec8BndrnFquzWtty+qMHocc=;
	b=u2mEJ2dM3GEeQA5Yx3jyuzEaOVV2f4JkwqtjiWdtFOay89C4PyCk0rtUSKLblGL2qd2Q
	 cZTnLeuUu99JBVzREo/ChLPxY9roDv7oytJT6iGC7l54gLz9eCNiyzXdSPSvyivbIZJ+I
	 9nCg5X4kTyPKJmrXUdIv97DO/VY0Q3tsISOkoYkN88Y+QJ0eUOQ8UQBZUjSLUu+5+Z8HE
	 EXXVnt4KRH0G2MBdFcNU+BzPg/ioF0wAMfiO9QO+jVtUliD+43lcXQVprsBwaPbZ21C5z
	 7sbuP+JnLi3CUSiw1nSRerCoJiwYIUVVi7pYnciOJHx4sWUVYJPczXc1Cma/FTwB7RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsmfTUYf;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B88606A31D
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 08:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B88606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jsmfTUYf
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-377157fde7bso926493eec.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 00:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794732865; x=1795337665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNFwIny9vR4/dtjp+ZSTec8BndrnFquzWtty+qMHocc=;
        b=jsmfTUYf9Zp/e0epLXvwAdxeVcb8c9E6NfI2YdOmZW9bc6soKN3+DCmJnj//3qoi4b
         RYCGU6g+Bo2/Hx66TXuty9ztzjnaRIFy5b8CiUWLhzN5qEA7ZJBbVa/4ohg+t46vOT0P
         AdTtCENJjN7uEXdztQ1ov3k355dd9Gfc5kV1KTHF6T036DTYdGumEdDILm9Uq2W/p6SP
         ZWBkvdifyprjbugg4rztU8kEEbd3Hrc0BdnUbfl7jyf1ws3T72+Fx+tFkEjho/x+JjqL
         /sliJ3cdR1MMX3/nQBhnpwQiZhkj8mDgh+6/YlqKMIGr+gHFfwlYKfpHV7AySsAcf4Zr
         K4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732865; x=1795337665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNFwIny9vR4/dtjp+ZSTec8BndrnFquzWtty+qMHocc=;
        b=dvIexIKYDBGtCzQVMHlizGc/s9MfwSUcSXvVkKa2LhEj+Jn8ZY3IjC9UhOxwD4IdiO
         QzkYPoVUw+ZXsDraLVuSHeL6JHl/9xjTIEwdOTrnzFVGAgQhk+s9WTV5uStE1VhFPNf5
         JPrz3Rxy7z/3lmE8UiAhyQ1dJC6r/2ODmI6hkULMuZZQkSdL2uTmIXbQm7DaJLIOb5D0
         ltdIq/31W0fZr/+FVNbxoWD6dPReynNSo9EMEGplnj2zKO6W7oKvEK/zBXai2KMCfnHq
         Iq8GVCL78dOLbmcHsG3spjq5MwrxMEwYEXmpIiAUJANsYP9UHtPb5ijIEzbiM6d1J/3J
         nsMA==
X-Forwarded-Encrypted: i=1; AL+hErHRN9kMLqKYPVFwjSa2Ib2dJSHWDlBqHgvB8nAUyg19FKllym//D44SsYdmVk3IckW8K7IrZA8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1YMVSp/0T7VMjV3cjKLzyGwA1yefSfjoMUlurJArg2bUElKI8
	Zwq22YnWR/ldO5jnmPWHpQ2Xrjc5oU3lfob89MJ1uhrXN9B/t2yt3LnH
X-Gm-Gg: AYBFou280VuP+yP04l4l18H2E1I3yNpjvrvqTsGOoinB73tZAFxhErJk6XhlgEIMkNv
	KO2bR9rHWHAyT2mfkEQ8+fka3borKS6VmOmvHYeKN3if4hKC/bRgDFWlyXAe1TayfEY+KcvCzan
	r+39nKJ62WN4eSXfIxjweTMVGppKY6uaEirfwwoZkqSGYYt4RKxNBd0tO6wrVFSi4EENJS6/lYU
	lMJezRrUS2aVdt2Aj5GMON2Yee3NS7UP38ddtKyoP+3ap3Cjfqj0VjiVadsH/6i46BaFcrzcncn
	JiiPoO6HzH0Bf63/P94oHP2jDZk49ZzElhqW/7Jb34k4THEpIC2Q+DiinvDGL7M9TvtB+k6OQWQ
	j1HiUv+ayUeePzpVJcU7i7TYqxlMkndltkK3XB9bE0sQ9rTtKP7wsZs3zpo3v4sKZkKgt0yw0oN
	k32eXhEMmkXcswzHjT0gM+/Wg8iTmVR2KiGJTINCqvPnpBuRgf2cKX43zzkArVwvkiAvyRDTqGT
	9XJKKz/XLrRl9m9pksdXust+XyaQy/AJzbX8wV3DAu1jJ0TMOZFmvaE6Yt0gwkxW6WjYzIjiA3p
	at0EOstT9308KiO6bDesdxm1oduVJgjoEQOJ9KTCFCGAZwJ2RWgqoavhTODbPVjpDR9BhYxYuFs
	eCje8GYxfT9et/q0CLLU7lTEL09q9CT2poDW5ofF26plot6XQHq9E1o+9KkE=
X-Received: by 2002:a05:693c:4141:10b0:36a:15cb:30bf with SMTP id 5a478bee46e88-37966b52639mr7954428eec.13.1794732865444;
        Sun, 15 Nov 2026 00:54:25 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm22437361eec.26.2026.11.15.00.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:54:25 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: davem@davemloft.net
Cc: edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	yuantan098@gmail.com,
	n05ec@lzu.edu.cn,
	ylong030@ucr.edu,
	andrew@lunn.ch,
	f.fainelli@gmail.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH net-next v2] vlan: remove MII ioctl forwarding
Date: Sun, 15 Nov 2026 08:53:43 +0000
Message-ID: <20261115085343.53218-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

VLAN devices forward SIOCGMIIPHY, SIOCGMIIREG and SIOCSMIIREG to the
lower device. This exposes the lower device's PHY through the VLAN
even when the two devices are in different network namespaces.

Bonding used MII ioctls as a fallback for link monitoring. Commit
23a6037ce76c ("bonding: Remove support for use_carrier") removed
that fallback.

Remove vlan_dev_ioctl() and its ndo_eth_ioctl hook so MII ioctls on
VLAN devices return -EOPNOTSUPP. Applications that need PHY access
can issue these ioctls on the lower device.

Suggested-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
v2:
  - Remove MII ioctl forwarding entirely and target net-next.
v1: https://lore.kernel.org/netdev/20261106124639.12584-1-dennylin0707@gmail.com/

 net/8021q/vlan_dev.c | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/net/8021q/vlan_dev.c b/net/8021q/vlan_dev.c
index bca0a3693636..cff36d3fc6c8 100644
--- a/net/8021q/vlan_dev.c
+++ b/net/8021q/vlan_dev.c
@@ -406,29 +406,6 @@ static int vlan_hwtstamp_set(struct net_device *dev,
 	return generic_hwtstamp_set_lower(real_dev, cfg, extack);
 }
 
-static int vlan_dev_ioctl(struct net_device *dev, struct ifreq *ifr, int cmd)
-{
-	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
-	struct ifreq ifrr;
-	int err = -EOPNOTSUPP;
-
-	strscpy_pad(ifrr.ifr_name, real_dev->name, IFNAMSIZ);
-	ifrr.ifr_ifru = ifr->ifr_ifru;
-
-	switch (cmd) {
-	case SIOCGMIIPHY:
-	case SIOCGMIIREG:
-	case SIOCSMIIREG:
-		err = dev_eth_ioctl(real_dev, &ifrr, cmd);
-		break;
-	}
-
-	if (!err)
-		ifr->ifr_ifru = ifrr.ifr_ifru;
-
-	return err;
-}
-
 static int vlan_dev_neigh_setup(struct net_device *dev, struct neigh_parms *pa)
 {
 	struct net_device *real_dev = vlan_dev_priv(dev)->real_dev;
@@ -1105,7 +1082,6 @@ static const struct net_device_ops vlan_netdev_ops = {
 	.ndo_set_rx_mode	= vlan_dev_set_rx_mode,
 	.ndo_change_rx_flags	= vlan_dev_change_rx_flags,
 	.ndo_work		= vlan_dev_work,
-	.ndo_eth_ioctl		= vlan_dev_ioctl,
 	.ndo_neigh_setup	= vlan_dev_neigh_setup,
 	.ndo_get_stats64	= vlan_dev_get_stats64,
 #if IS_ENABLED(CONFIG_FCOE)

base-commit: d1f4b7c6b997c29de67ad7178ababac2328cb1b4
