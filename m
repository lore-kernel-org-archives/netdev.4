Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794983316;
	b=PM8hwHgs1f5kb5YQa7JcXHEzRuCfwDBs/pPQGs/RjabIJAkLWPHm6N1tOmjZFJZ3WSca
	 Hw1ip5OJXhTq1qjP/whsEuMSbH31S0e6fEpE9bZglpgVd3XayX8zMSjEFp9tIl3F+x2aP
	 VNzLdAjBhGN7bLf+ekr2o71Ky+jDJExbWE7pDHaoRHGFLEJWRIGQFB6j/XjxMju+N9iE1
	 p1UbAzI7sOloHiZfn5xRKbg7SBfu/+oG5Bfquj4wMrSEFBe1rFbtfdPZM2JcNulYma1PC
	 WR+Rvh7LW3dQENFdzR5MZ2hOJZICcGMfYGezhtM0Xd7tNRAQw1pZFWOnCGb4vdZXKcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794983316;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zBD049jgKEDWg0flByRT5kw4pfgUIEgfPQPTp/CuTrY=;
	b=nc0oEJl0sUTUoTcW5XOjU/2P6DuFtGtgbmG/2EUtLvliDqlZrfOhThtk/hds2wRwhHvg
	 4URVKOaSiChTGLlupbY5asa6iI6f4oQuQcoIJgYlVA5e7rOQJXL3Je/kALgnW6/bE3Mjd
	 IVdVLF6G0F+WA8r5CBD9tsr2vfF4SWK1pxAJ1OIDXdxcu5jQOuKpfDL2AqM+RUtMbT900
	 srFn2h5vV0rbQTBs2wYteFJjLqCwMHRJ0mphBTI9h9YuSiJJMU8n8uNY8uUdlHi5wu4jC
	 rhMsWamd9GXxFDTfDSrbTkk6DK05st8f/xhvAVfGNtKgCUsMqDQqiIoZrS6TJavxdjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ZpNF5iFy;
	arc=none smtp.remote-ip=203.205.221.153
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD1A4606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:28:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD1A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ZpNF5iFy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794983311; bh=zBD049jgKEDWg0flByRT5kw4pfgUIEgfPQPTp/CuTrY=;
	h=From:To:Cc:Subject:Date;
	b=ZpNF5iFysgwh2ReGnRUrqpa0NrwLdtcAF3UXscM/1CCtVEpxMTiwcYhwffR1kCNaY
	 9cAsoTAOqnRAUk+AdTZhElWgI94lJvz4AKxgFLy2NKgLl47ID19kf9yaMbXwIMk8Bh
	 q4xBHsS1SSPQWf6q9USnTey9trtFYGMg6coHlmEc=
Received: from shuai-VMware-Virtual-Platform.. ([117.158.156.199])
	by newxmesmtplogicsvrsza53-0.qq.com (NewEsmtp) with SMTP
	id 71CB48D8; Wed, 18 Nov 2026 14:28:28 +0800
X-QQ-mid: xmsmtpt1794983308tolviv2ep
Message-ID: <tencent_F3B718D78486FB80B4040B92FC5BD3076E06@qq.com>
X-QQ-XMAILINFO: NnYhxYSyuBnLsGbf9hd+YgNDB6t7gGrxggf8sBH0gL6Q4zAtfovSGnVj/sa1dL
	 iUVnFgmsywo6TgS3+NqP8hRYb96q7ua8/sZNy4d2XviUjmLl3Q5BN0hTi7N09OqQ1I5CjVZ/SVqy
	 sw51K8YzcDU/bRoTKvfgs/GK5BUrFdBu317Ah/FiYZ63V8FXDUyu2FH5rpO5LFgGQShdU99A8rNZ
	 33W5i9u+/qisH+zFiT7YCkhuR2N51Jix7Q7GDMBNGZ3LPsadIXWhBgwNECdiMow+YysVXK5hmduz
	 S8QEpAUym3+QgzVlzJxXo+1yosbcSDH1sBwPC0PBLR9mLDChQoiX9Yb16xk7rjuOOgykcgFA/AqD
	 F809u4z7/hkwkpPrnQS2nFmLKG9UkeamzFWGpZLFA7WubKqH14zY37Y+OUqdJfu+gVpdPpEz20is
	 r7oEn71YZf9Q5H2j5dtOQGndNqra8gXdtM4Q++tvDvqfL/9ayrV4fniM+cA5Ey/Sz+qFkRp9RwO3
	 QZCRiiTeEOv/46lSSmeogVi4A0N2uhNkylLge8HBO+NTBYzTN/ccRhbPaMJOt5HQmXgGvA5R/TRE
	 HGGD6xOZ6q4GA+TJEO9GlFQopMjykFaC2j7LOvMMFYQcrXMj1YUTXhFo52wccAwKrenskdGir8zF
	 F4onmgWIeMQZGY04mOWyq+nnyRQ3BoQRe4f3HnujG7H2nmceyJL68ih6vsTvi4NHmB+x69XLS35N
	 bZb03DC/y++JAhwresqTIZ2Lrd40Co90QHJ36Abr/8bHTgGFYJcMw7nJfB5lKwWiThW2ulZSi+jz
	 AM9dIceYqZUsE6kUAtnZxwEECQerljPMY5l+vcHql59oHMgE+36rfXTzIH1+wxziJiWSZPfmML9Q
	 jgEsZvgOApP4vUP4GAPk2c+qVh55alFQrD2kIEJe7L2yC5bTVrLI2LVqnzCwH3D+U50mCfyD2GlV
	 Q1D8nb07CwbmgRJLYgN2ung0s2Zi4aqHeIR/XvFvlzpf6yyx5NzpKrBKNKKJuybYocHydKO8MzqR
	 63uPl+sHj70D6RQtT92DSx8MFY0hxavrhkDoCy8q+8nteRemTzVct57rYAEzGh5ewRQL13nKww7t
	 lIKok5/1FKjZu6nGY=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
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
Subject: [PATCH] ipv6: addrconf: regenerate missing host route on RTM_NEWADDR
Date: Wed, 18 Nov 2026 14:28:28 +0800
X-OQ-MSGID: <20261118062828.840641-1-847807867@qq.com>
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

