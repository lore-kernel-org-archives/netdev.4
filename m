Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983419;
	b=HofwLnlX5PrpH+mpGb0Qf2dsVFr0HofhVkn5G9kxx1nzMwXj9Ztf1hL2czqklkHVe4Rh
	 y3y20dfm/xjaH6wYS0Ol2Pm+wPBLyO2xyWQfZsk8b4GS1qITcShVO5jWnx2FdCYjJHeSw
	 Mc/aZwUPB4aztys8qOxcx+mmDsX2tE+Xq/2m4lp+PgcGDXD0y8k6awJZyKoLhWuksNApW
	 qW1Q+wGHimwrL+RbOfIqAhFiii+fi9UzMPRLZJpkb2+XLeh9zCRNNA34408J8JX1aK+Xp
	 RTXqhr4gZPqiivxU8BxyssHb9fJtCfZtH9gPwsFvUhmtHfqPgBgYc+52caSnNy3QPOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983419;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yUNkvnQgkpAUmM7UnJDGcKS+DORiVd6eaYFO8hODs1E=;
	b=vTBFiS/Vsq/dcVAkboegQlFfVGHnqBex3gxl8HdrkS730f+sxi3KEsEp9Z2DbwLbtucp
	 38DIGDq39mCbxt+01XgY037/ZlKwOkXLK0qm32sHtXH1yx6gYCpwx85fLrWzEuiXIowwv
	 /gLRcjEn0CkpIWU0EwzWCMkOGQZPIX5e0aHH/DenFdP00pzG2Y8f4bHaA5Rth4rdcP0TS
	 aUHbUlpo1OctCRZoAtyCrn2fL0EEWrpB6/xb/F4wXToHRCsKOnyjjgnJ41Bb3hvnSgiAA
	 PNgrubDjYVcHmYJGMu+zFJmT7fQ9NSs1DbdH70hh/2GCUvyQQxfL8f/LEHlP2kVEgQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ko43Ox4j;
	arc=none smtp.remote-ip=162.62.57.49
Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BDB606A339
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:30:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61BDB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ko43Ox4j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794983403; bh=yUNkvnQgkpAUmM7UnJDGcKS+DORiVd6eaYFO8hODs1E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ko43Ox4jx0aKDkRXFoAqJMPhj1YwfHip3IycmY2cKhlWB+XeP9p5YUa+Q/viwjnwV
	 2Mh3HhdgJDUUUE1s4c9fJTYEWs0u5rOlLOsD0xsKRmcQNr/APSXdgUqn9jTo7LdtgN
	 3Ypnlxf96Y+oBVPza/7ByhJ5NcS/9CyzbY538+xM=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza73-0.qq.com (NewEsmtp) with SMTP
	id 780AFEF0; Wed, 18 Nov 2026 14:30:00 +0800
X-QQ-mid: xmsmtpt1794983400t0euiw4ki
Message-ID: <tencent_98F714E924966679E826125C2CB18B092A07@qq.com>
X-QQ-XMAILINFO: MDbayGdXPuoeVlDwiAHpY9olE8QoVaZ52ALez41k/GM6rZtggONbbYUZ89KPty
	 xevHCAjqfUkSAXGeJxLZy3y9Ej8MlyxYQFZWMdalyA25Xz+EzAIXzN24SrHIhgSqz2jdbWPzLi/F
	 BomMURei64Jw0LeoXTXN3Cuz4tMtszb2/u39ujSvgWZFCoUzIj4bBuJfnTfjMjtMTR8jSZLk8VsP
	 r0j6YkzQ4yYS9AzmxxhXkxumCIl1AyV7xtrAKYkH/gDlqldlWtY6wI1uIwruSgty6LrJknlCY9/E
	 iAZ9iWn+y7cK+2JgGCjW34WBzT0dBCKsuN/yNaucvrg8aML8+CcVsnRWYXT93mgG0oJV/BjN9rI9
	 LRwJ/lKClZIoT3BgDCQOnNtslsesXPRnP7Qtp+bDYHvNHTay55W/RUND9GYtUirnONd1PjupZpUu
	 Crp+mPQkRUHkHCAIsnDZx+bk5q22HdblYqE2B7V9JTizMz2D+rH4zXb4/r5ErPNoGlu3iGZifaU0
	 EqZetzhupTlHghe0Y4jiK7M9XhfUe1k7p7Cx2U/ycv2K7q2B7nya/+Bd60GIaHJfAppKPL4rtoKs
	 kiCDxkc8Dxq82cZ8QUN3jRsKl8IWiE4bhuZsfyuons+WbXcaAjlRHV7Vm3bwLxTCEnYSszRKTn6m
	 yDqg2JkTZ4Pz6Bmhd1M238fKSBNbGVnpznakyCFip+AQviBOoPiCaL0GzzT4W31J04iO8fOCIMDm
	 Yj9Pxr3tEZxq3EawQTxeODTL0iidQGvU0ZTBJfFojF1zzCk9+kU97IJYK+4ZCSAId0mR+iPGwZLa
	 kID1xNzG2Yr5c2vcDqC+xdFVfrThoP1aAmDDEjB9vJnRW/oszZnpBoyIJd3PQHUe9ojFKIiXLltf
	 4JBneQOWVy3E29vqMAHR4HK6n4VENM3iSOUz/lxqdznn0JQ8nCjk4NwOfC4gW1QHT4j3Zlb6n+In
	 pZnHX6cZYqc1KWjqZ3PMmtMx3182LSI52ciunK+KFM/4E6s61Xd476NEckZTkXgn0+5kI6a3+GQm
	 FbGSQp0PjGoKVOiIU1X26/i1SzfentGTBZMk2QBbQ/AcL0nPglfpeGlmehj6CXTpfhKrLjB4Y81P
	 SKJG8AJhMbooUV+4vdpc7qof5T1JxA50ANnQbBJutM56bdooGTHpzu5QGEqdCHq5ywhfb3kHFd8/
	 Sep+8=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
From: Shuai Liu <847807867@qq.com>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	edumazet@kernel.org,
	davem@davemloft.net,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
Subject: [PATCH net v2] ipv6: addrconf: regenerate missing host route on RTM_NEWADDR
Date: Wed, 18 Nov 2026 14:30:00 +0800
X-OQ-MSGID: <20261118063000.841588-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118062828.840641-1-847807867@qq.com>
References: <20261118062828.840641-1-847807867@qq.com>
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

When an interface MTU drops below IPV6_MIN_MTU, addrconf_notify()
stops IPv6 on the interface via addrconf_ifdown(). With
keep_addr_on_down enabled, permanent addresses are kept but their
host routes are deleted and ifp->rt is cleared; recovery is expected
to happen when the device is brought up, where the NETDEV_UP path
runs addrconf_permanent_addr().

That recovery never happens when IPv6 is stopped through the
NETDEV_CHANGEMTU path: the device itself never goes down, so no
NETDEV_UP event follows when the MTU is restored. The address is
left with ifp->rt == NULL while the device is up, and every later
RTM_NEWADDR notification only warns:

  BUG: Address ::ffff:127.0.0.1 on device lo is missing its host route.

syzbot hit this by flapping lo's MTU across IPV6_MIN_MTU with
keep_addr_on_down set and toggling IFF_NOARP, which restarts DAD;
DAD is skipped on the loopback device, so DAD completion and the
warning repeat on every toggle and the address stays permanently
without its host route.

Instead of only warning, regenerate the host route with
fixup_permanent_addr() when RTM_NEWADDR arrives for an address
without ifp->rt on an up device, keeping the warning only for the
allocation failure case.

Fixes: 2d819d250a13 ("ipv6: Handle missing host route in __ipv6_ifa_notify")
Reported-by: syzbot+af16ddc8fd22a1d135f8@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=af16ddc8fd22a1d135f8
Signed-off-by: Shuai Liu <847807867@qq.com>
---
Changes since v1:
- Correct the subject prefix to target the net tree.

 net/ipv6/addrconf.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
index 4b0cb7d23541d..70230ffdc077f 100644
--- a/net/ipv6/addrconf.c
+++ b/net/ipv6/addrconf.c
@@ -6357,17 +6357,17 @@ static void __ipv6_ifa_notify(int event, struct inet6_ifaddr *ifp)
 		/*
 		 * If the address was optimistic we inserted the route at the
 		 * start of our DAD process, so we don't need to do it again.
-		 * If the device was taken down in the middle of the DAD
-		 * cycle there is a race where we could get here without a
-		 * host route, so nothing to insert. That will be fixed when
-		 * the device is brought up.
+		 * Otherwise, if the host route is gone while the device is up
+		 * (e.g. dropped by addrconf_ifdown() for a low MTU and the
+		 * address kept by keep_addr_on_down), regenerate it.
 		 */
-		if (ifp->rt && !rcu_access_pointer(ifp->rt->fib6_node)) {
-			ip6_ins_rt(net, ifp->rt);
-		} else if (!ifp->rt && (ifp->idev->dev->flags & IFF_UP)) {
-			pr_warn("BUG: Address %pI6c on device %s is missing its host route.\n",
-				&ifp->addr, ifp->idev->dev->name);
+		if (!ifp->rt && (ifp->idev->dev->flags & IFF_UP)) {
+			if (fixup_permanent_addr(net, ifp->idev, ifp))
+				pr_warn("BUG: Address %pI6c on device %s is missing its host route.\n",
+					&ifp->addr, ifp->idev->dev->name);
 		}
+		if (ifp->rt && !rcu_access_pointer(ifp->rt->fib6_node))
+			ip6_ins_rt(net, ifp->rt);
 
 		if (ifp->idev->cnf.forwarding)
 			addrconf_join_anycast(ifp);

base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
-- 
2.43.0

