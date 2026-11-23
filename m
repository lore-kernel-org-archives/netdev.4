Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437902;
	b=sdAXddLwAfdMcX9FiydGepJfMeZWFal+eX+93fI67MAUXbBP5HnQTMn4kyjpCcvNSDzU
	 kRwy+mwkxH9cmg9XS0s32x9H7OZYZ8/ROaS5y4oqc9ncCRsBgaSfIGWHAiQZ7R9du0Cew
	 hgDFEaraXy7/9CRBuMSor5q4VEmH5z+WCOyDb9b2vd62MmNhlEhrHtBbX0kHs1fkAAZtj
	 cuUJvEqcjdD2dmULdXz6PmRsMQVwl2Oi4e89QYupLkIp25Vq9+ajbTRStYMhzWZOpJ0q+
	 tA4nHR18fNrz492bNJmsrVbXEX2JENuL+c4AUUH0FpMi5HbHGE8n8KI8Ghpx/H8ibjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437902;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FGsGWsvJteNktZfC/eSBPoU9nC6E3m3ko8yohnbpCmk=;
	b=nxlKPkQRwT54q40Fh3cWFka8qeZn+YNnXwToN5OZJ50k2T38vsTGkxHYPxV1323tvUmu
	 4Xf1L3D4KzgMGh4ZiOfE6HtOlYJjc0L+snGlMMrf3ymM48eZM6+NDm1lac1dz8tE/k7+n
	 5zIHMgKIKjlmO1pabh0dmXTAwAqcmGWbx+WpXaWIXHorwn0IgDKB2XeBjSJ+nL2NmQf4R
	 +T6AbXRznmMPWAPAW3Ryy7GmQnFA2bqwm6qcbVgrw754/f6pgOAqutJo9hmTAVaUrNOfV
	 /kU0yJcN+5mqCNHkNeNC0Y7sjnMlt7WyZSWMx6P9cLfp2BTl3mKwWxjsKkuC5L1V1NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ar8/FiDe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B4F606A333
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ar8/FiDe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D7D1F000F0;
	Mon, 23 Nov 2026 12:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437902;
	bh=FGsGWsvJteNktZfC/eSBPoU9nC6E3m3ko8yohnbpCmk=;
	h=From:To:Cc:Subject:Date;
	b=Ar8/FiDeDrhEUCrs73JCPjXeRcdz9l4fO5OHWbB/TkgCfVKDG927OAoQmPYu/jcab
	 0tD39na4+ThVKpuRgHYSlfX+CJNCBBkHK+VHiHuJbGh9/VGmgkXUPxMsfU+7J0KYtf
	 4VTTBxMjLiz2s/U9Bwviqy3h915vzsGM1TUpQDTAi/UzRXaqbI2+aUbbL/0C/qs7gZ
	 hYLTROWfv/UCSKeYd56GFOzhAOVSJQOVXjlTZnbv/RWqwixfCXo+2A/9FoCn7o5/7r
	 saQyYMlKhem6afqjMukxMMB8aRxPdnykqxnMOdI0jCcmdwFYNul+oHX61sSwZoTttR
	 8Hg3FY63/ZlWQ==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	edumazet@kernel.org,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net] ipv6: mcast: do not pass uninitialized bytes to dev_mc_add()
Date: Mon, 23 Nov 2026 13:44:58 +0100
Message-ID: <20261123124458.205233-1-edumazet@kernel.org>
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

igmp6_group_added() and igmp6_group_dropped() build a link-layer
multicast address in an on-stack buffer with ndisc_mc_map(), which
fills a number of bytes depending on dev->type.

dev_mc_add() and dev_mc_del() then use dev->addr_len bytes of it.

Since IPv6 multicast joins and leaves no longer hold RTNL, dev->type
and dev->addr_len can change between the two steps, for instance with
TUNSETLINK, or when bonding or team change their type.

If addr_len grows (eg ARPHRD_ETHER -> ARPHRD_IP6GRE), dev_mc_add()
copies uninitialized stack bytes into a netdev_hw_addr, which can
later be dumped to user space by /proc/net/dev_mcast and
RTM_GETMULTICAST.

Zero the buffers.

Found by Sashiko AI review of a tun patch, by code inspection only.
Kernels built with CONFIG_INIT_STACK_ALL_ZERO=y are not affected.

Fixes: 1767bb2d47b7 ("ipv6: mcast: Don't hold RTNL for IPV6_ADD_MEMBERSHIP and MCAST_JOIN_GROUP.")
Link: https://lore.kernel.org/netdev/179512665919.3136.5931555157250030152@kernel.org/
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Signed-off-by: Eric Dumazet <edumazet@kernel.org>
---
 net/ipv6/mcast.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
index ecef55f26189..bce7287ae709 100644
--- a/net/ipv6/mcast.c
+++ b/net/ipv6/mcast.c
@@ -684,7 +684,10 @@ bool inet6_mc_check(const struct sock *sk, const struct in6_addr *mc_addr,
 static void igmp6_group_added(struct ifmcaddr6 *mc)
 {
 	struct net_device *dev = mc->idev->dev;
-	char buf[MAX_ADDR_LEN];
+	/* RTNL might not be held: dev->type and dev->addr_len can change.
+	 * Make sure dev_mc_{add|del}() do not use uninitialized bytes.
+	 */
+	char buf[MAX_ADDR_LEN] = {};
 
 	mc_assert_locked(mc->idev);
 
@@ -720,7 +723,10 @@ static void igmp6_group_added(struct ifmcaddr6 *mc)
 static void igmp6_group_dropped(struct ifmcaddr6 *mc)
 {
 	struct net_device *dev = mc->idev->dev;
-	char buf[MAX_ADDR_LEN];
+	/* RTNL might not be held: dev->type and dev->addr_len can change.
+	 * Make sure dev_mc_{add|del}() do not use uninitialized bytes.
+	 */
+	char buf[MAX_ADDR_LEN] = {};
 
 	mc_assert_locked(mc->idev);
 
-- 
2.53.0

