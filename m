Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795514265;
	b=ZtWmFtsd963hWU/zYDPS498E2ct9ztLi816uOuNnDBSGXVB2zD9lwMX8q9v2fp+TZWdk
	 E9EsIKKK1SWt3mYVeTCRnG3wM86UoyM6GD/uboVcuZpzY3OeGryl10Xg8CpD0M7i38QMW
	 AmAJ9Boz9Nnn9DNWFYVgZ8JKxZcQaQy29PMHtuG2cGEvGPChIgZGHeb+GzpX5lzrr3GHG
	 vdgrL3gY1c8eLu7EMnmjpz+PQzO4HpEgGJPGoiDZ3AHM+g9ed6B0r0RA/r4k2KcJn+SI0
	 Kf86YsaMc6wkOJ73QvI2CkGdL2z8pyOpx5ZXIpbsF1NhZ5xYqJpMVGgYBwTWVT0ut9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514265;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=2yaoy14/Vvt6FTb4EA6lxT957AxrMasB8RChP9otngI=;
	b=04HfPCgdPjPCzNMBq1LH8Nzr88bHmzx0nwC4q4n4VLntX87g/+y+lnA1n3Wxy0dsYkOh
	 3XO8jRjaihf8wge3tcUsixGo19v0zserQlHL9O+InQAB4mkY67zdu38axXmzaOKy3iMUD
	 374Mw2/JUIxkJBsPXVnpvsqSD/HtM0ZNMZtx2Xw3IQKssQwqaLo8rHJEAmiEDqJUOWeiN
	 OsNZh/imtwBjFBx3Da/Pf+sWQEPQqgU0zdRx7K/fScTxSJp5nPpfxRx4U1OsxAvAM0WV2
	 DdevtGI5PZGQlaBIu6roO9jT06jg7kP1OaDW33eKrp9DmfLzmGU+mxsitI99hWKmOMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CuxgHJnw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBD2606A321;
	Tue, 24 Nov 2026 09:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CuxgHJnw
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795514265;
	b=VK13NTVx6kXXcM5DW+xCdZpRNwE3449tDCqeYyGC4CiuilO/nDj1L/JWkvkas5DqAyKC
	 xRsidGAGZT31G5e5XdlWfyl1MRGHlm3WrgwHdho28CBNSaNfggfWZ5RbjmjuUiXZbQg6k
	 bP5PuyQixGTWjQzE32ejTFTIdgXOoCUfB/1qhhli3QoeNxwq85ypDtNSS4GEE4P3Zrbgg
	 TUrPBYhIdAv67yvjTv/5hKdX7zEkc36ANx87BAqSDS2b4tR5aXyljFE8sbm/opsIWMSFf
	 xGV829m8/8pfNGyfKYB569mz/WamYbSzeIO5ZtA/yNMj4+wuuVj+AzcAx9SrebaUSPQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795514265;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=2yaoy14/Vvt6FTb4EA6lxT957AxrMasB8RChP9otngI=;
	b=gxps7Vu0NSUItf/cOrsO/xwo2/tIIEVtaXv1KPJlVJcNqJ9cQE8t2rfmgoaX2k2lh2yD
	 t1JSGq9+sbcrsZnWVrdvmXCVfedoIBUlbvL2rKruw91YrgWjpT7KeZrzr6YODH7QUwNmy
	 8pMvGQLhByvY0jaNyQSb1GtTTN6qyjUoR7+48Rim1dZvec0xO7yCw2cKPs09V2I7+fM6N
	 q/2kl9YJ7CYeWw1AOkFjUz8QOZMqAY8ZH8H+W4+iWwxyk/5qC4Al3Q3zfyEFuiYR/A7MW
	 By+aKjSj65hZGRKNpNN1lWsit85pbQ3TRF8et0L//tzXPXz1ecIs1JicDo9+kvbqwMA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 671E41F000D4;
	Tue, 24 Nov 2026 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514265;
	bh=2yaoy14/Vvt6FTb4EA6lxT957AxrMasB8RChP9otngI=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=CuxgHJnwTK07smQPlJSX8Gyxjvo13kuxymzsapvcLeVecC8GAM//IAOb6zq1HnVEy
	 RDbH18N8s/powdZmLGODQT0QS1WdAMnR+zHt3OUfmWCiCqzfqcfXKJ1YSQ8dRXjyxZ
	 gkXLJTez13rATWzdlLDoBPprcBYoRO8OFXkVEjftnmtnAiB0fG8C6bwsX5hPe1XZFz
	 07RpHdSR/g9AhFsaO8PIv0r+VcIUKbl+qcAsQ/xZuSlf6oCKw5yILFEoHnpNrmrqXz
	 A/YKcb9olr8HdZdY/RCqqHWoGHWZkS4S0dMGIErdPb14doeZDpmwPpOm6CNcqs8QyP
	 /U3nBupXm6ZOQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BC3F54C99A;
	Tue, 24 Nov 2026 09:57:36 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 09:57:36 +0000
Subject: [PATCH net v2] l2tp: require CAP_NET_ADMIN to join the l2tp
 multicast group
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
Message-Id: <20261124-l2tp-mcast-perm-v2-1-416741ccb334@gmail.com>
X-B4-Tracking: v=1; b=H4sIAI9fBWsC/yWMwQrCMBAFf6W8swtmrbX6K+IhxlVXbAzZWAql/
 27U4wzMzDDJKoZDMyPLqKavWIFXDcLdx5uQXiqD19w5xy09uSQagrdCSfJAftP3vOu2+5YdapW
 yXHX6HY+IUnD6S3ufHxLK94Vl+QAGclJueAAAAA==
X-Change-ID: 20261124-l2tp-mcast-perm-a38827659421
To: pabeni@redhat.com, kuba@kernel.org, davem@davemloft.net, 
 edumazet@kernel.org
Cc: netdev@vger.kernel.org, maoyixie.tju@gmail.com, 
 anilkaushikwireless@gmail.com, stephen@networkplumber.org, 
 linux-kernel@vger.kernel.org, horms@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795514255; l=3479;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=b8Zf/qow/0DrC6IfxZ7GE0dxZpPJKUEKTCMj81fhw0k=;
 b=tdQFEPeV4B/PyXWBJ+HPGKmRisjKqFCKlazcLG93B0jtoHXtzuOGVGHO1yywQbySbWxKnMTdP
 /QB3UIF+ZCFCPOg5cQwhHo4b6fGLQdgCe2M09h6fuGE7rYdKNpMiMG4
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
This patch handles listeners in the tunnel's own namespace that join
the group after the l2tp family is registered.

Mark the group with GENL_MCAST_CAP_NET_ADMIN, as was done for gtp in
commit db627e71b6da ("gtp: Require 'CAP_NET_ADMIN' when joining the gtp
multicast group"). genl_bind() then requires CAP_NET_ADMIN in the user
namespace owning the network namespace, the same capability and
namespace as the tunnel and session commands.

genl_bind() only checks the flag for a group ID that a registered
family owns. A socket that joins the ID before the l2tp family is
registered, for example before l2tp_netlink is loaded, keeps getting
the notifications. This affects every family that uses
GENL_MCAST_CAP_*, including gtp, and is fixed separately in genetlink
[1]. Backports need that fix too to cover this case.

Found with a static analysis tool and checked by hand.

Link: https://lore.kernel.org/all/20261123155503.2497063-1-anilkaushikwireless@gmail.com/ [1]
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

Changes in v2:
- Say in the commit message that joining the group ID before the family
  is registered is not covered here, and that backports also need the
  pending genetlink fix (Sashiko).

v1: https://lore.kernel.org/all/20261120-l2tp-mcast-perm-v1-1-22dbffa88655@gmail.com/
---
 net/l2tp/l2tp_netlink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/l2tp/l2tp_netlink.c b/net/l2tp/l2tp_netlink.c
index a07009d4cb00..c442e953df66 100644
--- a/net/l2tp/l2tp_netlink.c
+++ b/net/l2tp/l2tp_netlink.c
@@ -31,6 +31,7 @@ static struct genl_family l2tp_nl_family;
 static const struct genl_multicast_group l2tp_multicast_group[] = {
 	{
 		.name = L2TP_GENL_MCGROUP,
+		.flags = GENL_MCAST_CAP_NET_ADMIN,
 	},
 };
 




