Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795164675;
	b=2+h99gHcuNfcL82oTlT4WpVG7w8hiouhecK1K1udA1rgwYcIbrdb1VeZxRMtmGSOOQHL
	 cs09cUUsfll6BJbum4KSa7s4tkB38a1sBSj8M2OmTtf7nDLhzD0GX4y8ZFkv4G0qBS5Qh
	 gSR1h/8kPjlYtwsjh76RczmHmro/6Mki4JF0Mw6jGAlNp5v7WNV7N/nrtZ7JRtPIErI+4
	 ktE5lePnVfZBXkfk1x/1ij8k44sPnZr16KJh+jwLStkI2CAemQ1wbRHBhsDu0RRbsjnAG
	 LHrdzpH09k5VyrazCzXzADEmO5YFiSGVKcR7nGoP3nlwqo3Leoi2mHiCBGixgMU0dFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795164675;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=X3OqZ3ppIXhEWYEEUB0+dySLF8XbZ804ezxGDpnSDLI=;
	b=L67UiTM8xAetb1Yp6G51asg++PoGnmU1fPDhrVhNTt4zAlzjrNqkYEz2c53PFpwTCvAY
	 zaskLiQHB/kIJ9VernU6nKippQV55e8L0QxBCdTGiTrF7hdjsPCHsD9oLEwvOSdKdOgrN
	 k8qp6B1+X1GuW4xoUaiUYjWww1BQjWZ4eeNXoaspdPCLvnEJUnQRXs2RzDBw+CieexwQd
	 nN2sy6hxvI1hwaD2a5Gr8VU0eS6hp0kCQAtYWI4xNcfD9Gswfgw8q7cJDhNyWYyTlsh27
	 z4zk7Isr6YUspTvOWhka4WyDxy/OvVlSyoEk6mScZvFZQaQDAPzxsiYpyg8Ma7Y3RIg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="f8/yMJkf";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42477606A32C;
	Fri, 20 Nov 2026 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8/yMJkf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795164674;
	b=zimM3smVD3z3AqS3SOJzRCA8/2yhGtyYuYGyqju2PT+7M1osdzfdmu5mUM+S25L/nA8+
	 qDKiKFKXvoiKTnS68A9GKda2NH2120iNCCM2xTUMKfJCheWrkMCBCj5RfPIucJk6BhPGw
	 F55g6t3vcCaKTJ70e9Ec7ueRq9LSZi9f+fmOFsjSEipmqftojMCkXOGFiYvy+tXz0Jzq4
	 fwxjjCKUWyIJ/98aqsnLBIXZXrKS0tQVCzjNPMeIoY1Dn4Q8XYAsnYe3TBy6gogqpNrhV
	 dG8gNedIKNOIXHez1gW15dcNVlnb6ohvNU5eyzjYUmosOPPbKhN23iITMU+EpqTELug==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795164674;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=X3OqZ3ppIXhEWYEEUB0+dySLF8XbZ804ezxGDpnSDLI=;
	b=xsugVrFfLQ6KzSmWeCScqdYBe1Wp1qYSEnAf37dyOrwF+3tRX0WGIbWth5bu0k30Da5A
	 Sj4JnBiIrtTyES9hadCUVY8UKHmb6PbnAdT15zafGKXdAldb/ESeEogN2OC5e7c3Ik6v0
	 7ZNVwkVNUHN5oXLPLkdqrDOcdXFfGcGx7/ZkP4h/4CQ9u0u6iJL1P8HOK1t/NO3hjFZ7+
	 z4/HjhThqg539Bial4t2AY138FYntV+fh31nQk0hNhcHaM+xYxqLsxKWVlOzORG5ms0mZ
	 dlMirtT3f1m31WwTDHPEKbIPJhRYJ1D8J/kRx1gSYWVHsJjX/TX4gLQvZUCWFjYXbvg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3F7E31F000CA;
	Fri, 20 Nov 2026 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795164674;
	bh=X3OqZ3ppIXhEWYEEUB0+dySLF8XbZ804ezxGDpnSDLI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=f8/yMJkfguEKXqLZluIBOh4Cbru7FgWitzxO6ojQLtCwgUwAKSqxHlja6jsgJm+kk
	 XEkao54PlSQC8fIvos440tPTXY+ccXBeMoXuP/TRpkvbk9fRwzb+kTzl8ZLs3qlwpk
	 1d2BKqWIqvHmtu0gEvAiqvyya2G0wuAdqz7p6EPRkAyz6QGbzCJyR7JqjBMKtvBpy4
	 F8W6oq+p+qtOx301L3+HzmlR3cDLwnyzlf2Qn8bW/9BXqlcON1cmyKDb4I+hbYxXLB
	 nIzHD5cRI5UE9jZJ0bsCiTWn34xTKVWLkX7uYVsRZtfc7spwN7OrML1+7nvLYzY98L
	 vS/K/RVvRh3iA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B44E649784;
	Fri, 20 Nov 2026 08:51:13 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 08:51:13 +0000
Subject: [PATCH net] l2tp: require CAP_NET_ADMIN to join the l2tp multicast
 group
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-l2tp-mcast-perm-v1-1-22dbffa88655@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAKAGsC/yWMwQrCMBAFf6Xs2YUmQsX+SvGQpK+6YmPIpkUo/
 fdGPc7AzEaKLFDqm40yVlF5xwrm1FB4uHgHy1iZbGs7Y2zLL1sSz8Fp4YQ8s790cOE8wrsr1Sp
 lTPL5HQeKKHT7S138E6F8X7TvBxXVuZ54AAAA
X-Change-ID: 20261120-l2tp-mcast-perm-b76eac3deba9
To: davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, 
 pabeni@redhat.com
Cc: stephen@networkplumber.org, linux-kernel@vger.kernel.org, 
 maoyixie.tju@gmail.com, netdev@vger.kernel.org, horms@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795164672; l=2848;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=QYL5ERiD0rSoT6Kdzd/1Vi1hg5wYDxhdVPE3t1Z9Y9s=;
 b=/Egw0ayNzFvVWWOtDuOcExSGyss8K0jQOh1ad6zGfq1b5fOJ/5JqirMhiR2tEPNh0XdBYhN9R
 Ftjyjx8iaT3AOSZLEaxtcmaHOfN7pSFwGvxzOQznLpgYuBVe0gC/yn3
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

The l2tp generic netlink family sends a notification on its "l2tp"
multicast group whenever a tunnel or session is created, modified or
deleted. The message is built by the same l2tp_nl_tunnel_send() and
l2tp_nl_session_send() helpers as the replies to TUNNEL_GET and
SESSION_GET, so it carries the tunnel and session IDs, the addresses
and ports, the statistics and, for L2TPv3 sessions with cookies
configured, the local and peer cookies.

The tunnel and session commands, including the GET commands, need
CAP_NET_ADMIN in the user namespace owning the network namespace
(GENL_UNS_ADMIN_PERM), but generic netlink lets any user join a
multicast group by default. So an unprivileged user in the same network
namespace can read all of this by joining the group. Configured cookies
help an L2TPv3 endpoint reject blindly injected packets, and leaking
them weakens that.

Commit ed267f783c0c ("l2tp: send netlink notifications in the tunnel's
net namespace") already noted that a listener needs no privilege, but
only stopped the notifications from reaching other network namespaces.
This patch handles listeners in the tunnel's own namespace.

Mark the group with GENL_MCAST_CAP_NET_ADMIN, as was done for gtp in
commit db627e71b6da ("gtp: Require 'CAP_NET_ADMIN' when joining the gtp
multicast group"). genl_bind() then requires CAP_NET_ADMIN in the user
namespace owning the network namespace, the same capability and
namespace as the tunnel and session commands.

Found with a static analysis tool and checked by hand.

Fixes: 33f72e6f0c67 ("l2tp : multicast notification to the registered listeners")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Tested in QEMU (x86_64): three listeners join the "l2tp" group, then
root creates an L2TPv3 tunnel and a session with a cookie.

Before:
  root: joined, gets TUNNEL_CREATE and SESSION_CREATE (with the cookie)
  root without CAP_NET_ADMIN: same
  nobody: same

After:
  root: joined, gets both notifications
  root without CAP_NET_ADMIN: EPERM
  nobody: EPERM

This covers joining the registered group. Joining a group ID before any
family owns it is a separate genetlink issue, handled by "genetlink:
Reject joining multicast groups no family owns".
---
 net/l2tp/l2tp_netlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
index 89ef04c78787..98290cc956fe 100644
--- a/net/l2tp/l2tp_netlink.c
+++ b/net/l2tp/l2tp_netlink.c
@@ -31,6 +31,7 @@ static struct genl_family l2tp_nl_family;
 static const struct genl_multicast_group l2tp_multicast_group[] = {
 	{
 		.name = L2TP_GENL_MCGROUP,
+		.flags = GENL_MCAST_CAP_NET_ADMIN,
 	},
 };
 




