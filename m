Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355024;
	b=yeMisynEol9MakHxAWL+hOwNZ+akl0rtKAXkykqG2omVfmsN8IjJI1YW3s+CpqGMCfey
	 jsATBYDpW+ejrLEjJrKXaoi58s1pv0xHZPrSh1RMdAeyoQGRoUaNEy/G2TUx47Gju64Av
	 Fm/ejObZx6VyVZMW0dDRSMdZnOqBQwYw405hf2IRWr/t0nQtHekqLJH7puXYnAr1q1RWv
	 PSm3ADQMH85gXmrwIspiHZ0+t44ZVIi7PvWP4Z/trDN0EJzjRn5L/IorttV7WbbsNme9E
	 PGoW8gtUQZ31IyVyifWKhf5IO1+XTaWYlGWn2ezwe3+Y5bw3zoam8kiSczM+K9r+Omw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355024;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Date:Message-ID;
	bh=YzFMYrIE2jIubdYzcRDkTvT/AcT2d82nJZex8ivmvyY=;
	b=UK+i8dvZvLSosAZEPRt9Ekis4uHWnVtaG1AAt2bfYG8hp8GumjpEr+DQmas9LnVG/HHf
	 Z6jG0MsxVJbP6XrYxfWFeILquGbe4glOQBEPPgYiWEMxS4Oj6pCVXQ80r7JWJH1paaN9S
	 GGUG/8xH/eDb0EdbdMtTFZZcEc3J29UvQE/D7J5lEM5+Ge1fcbOnNZtYba2Atcw6b5dNW
	 P9f0uRmVbhyIQgGj018wmwa/YhJS4boynP5M8JARsjrLBjeED8vkyVOPLQTeGRCZEmyjZ
	 PCAwerP45gKeTC8m/rssda1XEP+LuGrnFrTj9PNQi8dwnAZDW1lMF+z2QcghV6G6Idw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ge3dGHYI;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DEA606A320;
	Sun, 22 Nov 2026 13:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0DEA606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ge3dGHYI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ge3dGHYIL7GODUvLT9luAKJ587yLQdeya4u3ZB1/G/iwmb7fI2iMyqe2OP0kjOgtIeNU5fVB1HtwW
	 J+muNX5Hf9fPYtl0VTtObva+uE96ZPO7DxAi6I/ow3D8/fEKV3M/rISL8cG2HGOx6tZoZh+XWknNae
	 gOVfIl74mx0zTcaY=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66b02f183258-00647;
	Sun, 22 Nov 2026 21:43:31 +0800 (CST)
X-RM-TRANSID:2ee66b02f183258-00647
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from [198.18.0.139] (unknown[112.23.105.246])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96b02f182818-70171;
	Sun, 22 Nov 2026 21:43:31 +0800 (CST)
X-RM-TRANSID:2ee96b02f182818-70171
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
    idosch@nvidia.com,
    davem@davemloft.net,
    edumazet@kernel.org,
    kuba@kernel.org,
    pabeni@redhat.com,
    horms@kernel.org,
    linux-kernel@vger.kernel.org,
    kuniyu@google.com,
    xeb@mail.ru,
    yana06070@163.com,
    netdev-bot+sashiko@kernel.org
Subject: [PATCH net-next v5] ip6_gre: fix changelink conflict checks for L2 tunnels
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
Content-Transfer-Encoding: 8bit
Date: Sun, 22 Nov 2026 21:42:44 +0800
Message-ID: <179535496489.1244648.10031965997557933761.ip6gre-v5@cmss.chinamobile.com>

ip6gre_changelink_common() calls ip6gre_tunnel_locate(), which only
looks for ARPHRD_IP6GRE devices. The same helper also handles ip6gretap
and ip6erspan devices.

An L2 tunnel can therefore change its parameters to match another L2
tunnel, and incoming packets can be delivered to the wrong interface.
An L3 tunnel with matching parameters can also make a valid L2 update
fail with EEXIST.

Use ip6gre_tunnel_find() with dev->type, as the newlink paths do. This
also matches the device-type check in IPv4 ip_tunnel_changelink().

Found while comparing the duplicate checks in newlink and changelink.
Reproduced under UML using existing netlink interfaces, without kernel
instrumentation or fault injection. With an IPv6 underlay named under
already configured:

  ip link add tap1 type ip6gretap local fd26:106::1 \
      remote fd26:106::2 key 100 dev under
  ip link add tap2 type ip6gretap local fd26:106::1 \
      remote fd26:106::2 key 200 dev under
  ip link set tap1 up
  ip link set tap2 up
  ip link set tap2 type ip6gretap key 100

Before the fix, the last command succeeds and received frames move from
tap1 to tap2. After the fix, it fails with EEXIST and tap2 is unchanged.

Tested on net-next under UML with W=1 builds before and after the change.
Standalone tests covered duplicate and valid updates for ip6gretap and
ip6erspan, including receive-interface and payload checks, plus an L3 GRE
control. Kernel selftests were not run.

Signed-off-by: Xia Yan <yanxia@cmss.chinamobile.com>
---

Notes (ip6gre-v5-mail):
    Changes in v5:
    - Return to the minimal one-line v1 change, as requested by Ido Schimmel.
    - Rebase onto current net-next.
    
    v4: https://lore.kernel.org/netdev/179491056935.741041.1816208847037703396.ip6gre-v4@cmss.chinamobile.com/
    Review: https://lore.kernel.org/netdev/20261122123555.GA2812544@shredder/
    
    Current UML build and runtime baseline: eb6d6c80d35449c27471b1874f13066c09a8964d.
    The v1 x86_64 W=1 allmodconfig- and allyesconfig-derived full builds used
    net 7076f684d513. Those full builds were not repeated for this rebase.

 net/ipv6/ip6_gre.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 26c0e1c4de18f8b44ceb05d01673aaadfbcbd5ef..9f1e58f9326afd27d097431ffe62efb0aaaaf58a 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -2064,7 +2064,7 @@ ip6gre_changelink_common(struct net_device *dev, struct nlattr *tb[],
 
 	ip6gre_netlink_parms(data, p_p);
 
-	t = ip6gre_tunnel_locate(net, p_p, 0);
+	t = ip6gre_tunnel_find(net, p_p, dev->type);
 
 	if (t) {
 		if (t->dev != dev)

base-commit: eb6d6c80d35449c27471b1874f13066c09a8964d
-- 
2.43.0



