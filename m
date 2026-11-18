Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006488;
	b=R4MG0isr+W7+jSaUBmp2jtwRi2JoSTSkBd4DHYgD5Nq463DbPhgrP4H7Tk1v9P5cB3/o
	 n4q9peHLQfRro/tpiicKn1xlN0VW8AaYmtAY+YjlZJkMIozm1IocnoYZRuhns2vZQsFRn
	 bp0y7npGa0bkFMRwbpE+BPqlvatiHdY8ltfVZJm6GDIPZWEVF69/LYGimONDe1CxqH3dS
	 f4xd4Dsi+q2UCxsNvR9Q2kIY7i5BFyB0rVlqgoswEvSJPdDeI5Y/rPzXkc0sMAv3wjl2x
	 Y7JeBk5OauLdH0bvK5X972uD9kTsawImeujALHjQ4avxAdhoY76GgJuq4/2kn7rOI4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006488;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=niCSpw7XBt4dp8JNqrf6cu9Q3LNf4AauznNxgtIuXUk=;
	b=fnokCX1evqwtCBCiYvF6m7f/FJh5I0PWZCUXQaeOC/F1ZXbvIkDQKBSS0S7y0g2/zvGu
	 /CbCdGsoXHyLd0xXL8kpJql831mWI6cVMQyNnyUKgZd6ki71ZzbHrAfpMXVt5ZYUh8SyR
	 e8mSJLXIhPUh8ztVHxkqI7186zhiGUBdDEGDwjIG7Px+uDGXGC2YJ4y6+oKihCJKoLFl0
	 9vPBtvJbtJQHYDTCi2qwfBjVEnoBACv9g+ZGeiUqiBzPaMXQiA5dvuL2EldEi72EHod0w
	 dmrxoL9UbcAgqEy7bNtFuRzfllIImzpnCyup4LpO1fUlXklNE5GjThqE0EAZid6rMgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0zIi1dJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A524606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C0zIi1dJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE3961F000C4;
	Wed, 18 Nov 2026 12:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795006488;
	bh=niCSpw7XBt4dp8JNqrf6cu9Q3LNf4AauznNxgtIuXUk=;
	h=From:To:Cc:Subject:Date;
	b=C0zIi1dJkeh3gVDivIMQ+vPuSYy4yG957kLD073xyai9R40QaxMaudEFWYAz3WhAN
	 mu1Asy74ab7/FJUSXQq2WqJ/wLrbx39XD0JH3Om0crCp8hZknIeOgXFYzKxohP0oXM
	 mKdsLJ3uqeYn8NLMQUZy3tKOdoD1pSlkN3e1VrNgnIiI3NHuKHcqbJT6hRomg3g6VU
	 IGaP9/vVrfCUE3P5ebQm68ee27+TjztcIy1OdbEcYC5/ROO04mecW8OgmEpHEWE//a
	 BIr7G2/QS/5vDxjbDJiCw1GRP8DGhH2Vqz/gvcpXIS7oggh7YMtcn5RPvM5etN+nDE
	 tkboVgG9lhBsA==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Willem de Bruijn <willemb@google.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	edumazet@kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>
Subject: [PATCH net] tun: flush uc and mc addresses in TUNSETLINK
Date: Wed, 18 Nov 2026 13:54:43 +0100
Message-ID: <20261118125443.1137177-1-edumazet@kernel.org>
X-Mailer: git-send-email 2.53.0
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

TUNSETLINK changes dev->type and dev->addr_len, but leaves
dev->uc and dev->mc untouched.

Entries added with the old addr_len stay in lists and rb-trees
that are now searched and dumped with the new addr_len.

When addr_len grows (eg ARPHRD_NONE -> ARPHRD_IP6GRE), dumps like
/proc/net/dev_mcast and RTM_GETMULTICAST expose bytes of
netdev_hw_addr that were never initialized.

bonding and team already call dev_uc_flush() and dev_mc_flush()
between NETDEV_PRE_TYPE_CHANGE and the type change. Do the same
in tun, but only when addr_len changes: if it does not, existing
entries are still valid and there is no reason to drop them.

Fixes: cca8ea3b05c9 ("net: tun: set tun->dev->addr_len during TUNSETLINK processing")
Link: https://lore.kernel.org/netdev/20261116024056.1274402-1-bsdhenrymartin@gmail.com/
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
Cc: Henry Martin <bsdhenrymartin@gmail.com>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>
---
 drivers/net/tun.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/net/tun.c b/drivers/net/tun.c
index d4870bdc156f..a2f56a4febb5 100644
--- a/drivers/net/tun.c
+++ b/drivers/net/tun.c
@@ -3379,6 +3379,8 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 			   (unsigned short)arg == ARPHRD_MCTP) {
 			ret = -EINVAL;
 		} else {
+			unsigned char addr_len = tun_get_addr_len(arg);
+
 			ret = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
 						       tun->dev);
 			ret = notifier_to_errno(ret);
@@ -3387,8 +3389,13 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
 					   "Refused to change device type\n");
 				break;
 			}
+			/* Addresses were added with the old dev->addr_len. */
+			if (addr_len != tun->dev->addr_len) {
+				dev_uc_flush(tun->dev);
+				dev_mc_flush(tun->dev);
+			}
 			tun->dev->type = (int) arg;
-			tun->dev->addr_len = tun_get_addr_len(tun->dev->type);
+			tun->dev->addr_len = addr_len;
 			netif_info(tun, drv, tun->dev, "linktype set to %d\n",
 				   tun->dev->type);
 			call_netdevice_notifiers(NETDEV_POST_TYPE_CHANGE,
-- 
2.53.0

