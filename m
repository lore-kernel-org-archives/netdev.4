Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795124344;
	b=FhazAil9VdQtdoTqI9LSM4NVlmyF8vy0BJIENMdDhQwx/qqZuaS6jXRdhRbAyou+iBp3
	 jJYLJzZaJtuyAS1PuVII0o52xiRviCIQ/xrRQ95s1FEAjxsd/zxal31wmboa3xWJWhOt3
	 wOv0sQ52P2oXWzW8asctEevdn4jcFpw9BWj8lB7H34M6UWNT6P2XKJbF61bMLP4pXrrIy
	 bNyGnMsJ+jpGuY2JP8IF2ixuKpaexQWaaSXU66hDKgz5mUABHvJE0WQolmTo4Io66Jx2+
	 qvtwG0rFc77+y+qq1LQQ7xbRpmeTwRlrWK9tZI1k7OjG1di1PLeKTnqJkY5m7gImiyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795124344;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=cZowWoYu/CSlUnUbVg5i5VVgsCSvFCZT5gcKYAGsOAQ=;
	b=kfaw4L/9wcI+UHHzzTTJ6XyZHKaG1pAO9WfF9G0duNqyaJqA/As0i5ZJACgm6yde2bk5
	 TIUrnU87jN3Lm6yx5BLDPt+Q349bx0Py9occuRhnaq9x0jTxOE7N6QLqPrEhiUFLgC/bi
	 Co0rv7d+z2qWTU2gmsRW3C+qEICioRfCOCNRnV05ejl/Sk0o0fOFyUauvucc18k6DlvZZ
	 XHuTfYdsUk+rWuOFBlDB9BrKq350uTOLz/c78Sg2eZnhOt0inoikUwgbmiMwVlFOQtFHZ
	 LnGvMiaKCI6IB/QcVKitibvcfyNxQiJVG33AJQlUkSIauIqUtLK7dksJNPZHxIenLdg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsuPlrku;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F5B606A324;
	Thu, 19 Nov 2026 21:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UsuPlrku
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795124344;
	b=YDLDxCgZXI37SJXek1he3s0te/5Az/HjvXQu12eihZ1oFeLVrRsoKkLrHp2mr+OquyyQ
	 FJkuZ89nyTWtg40u10SgXc15O9nI8uLZ7u+yFxmjygMx5SJ9DODVpQwpbIJdqKI6ZbzZt
	 F8P4h3GnTmbIqDdjac/BoGgp1RnrjALJMVD9KvFmFd8HwXW9zTGimtk1F5Nkx4Q1nQIZi
	 3hh9qZVsZj9pkFn5p6Qn7RbIxlO36oCE5ddgPhaF/J9hmn+HNPrBheyzAXNtppQddYRvK
	 nrTRfrPtYHPjQM6knoCD67pFfYC9oT8C3e/8IhhTNeSVBKod3Y54EfogXQmgLUgzyXw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795124344;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=cZowWoYu/CSlUnUbVg5i5VVgsCSvFCZT5gcKYAGsOAQ=;
	b=z9T9joXAgpmoiuroL7IKO5IgytKmTHjRn08aKYlOCCbtOn8G7CboVhqTaDjYmNJ5dy9O
	 RMACdcOtC6dJCiYD48VlaMl96pKZOGmyFqsRc7DQJJxyCo9pH7i4qRjpBQ2pJMYkozwg2
	 FZbpbn1AW1i4KrwTQuM6zR0ZYlRePKeNtCsMaxAO13e1x9crFAKQL9IheuQH6s0VioPIi
	 M1kEyOTIATjbZ9svtxnNpR16XZkuQvDSaMuUqwMoEsBsOmIOfFIe3WVq9d88b/QNhpRct
	 Ve29Qv32Ji6lqhpfPA7ygGBHgE8ZkvwMpz+6JRYxX75rZFwmIM8fvIVw3JyXxk0lQRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 627F41F000C4;
	Thu, 19 Nov 2026 21:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795124343;
	bh=cZowWoYu/CSlUnUbVg5i5VVgsCSvFCZT5gcKYAGsOAQ=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=UsuPlrkuoHWA4WPUErThLsFlsNYy252+xgkIHiBCtDIMJC8faXfvq0F2P1i0n6vKh
	 BUJNL5wACZH/i1dDaWXy/2TgBY21VQb+QDNpTKo5gYZocZWax+ILPh96+w1BFrilmE
	 0CLCfsa/4Oxt98acdECk5dKQaAuUK4b+Y6dE2PcMAbBSyMrn4UFYwgGOuwx7lpzaoW
	 GmMbcJWqZZ583GGZlRWzQhox1CX6IzYrGZkmqfq8TT/ynX9FQHmPXgen0cJ5iVXV8Y
	 I0kSAsaf4k4wdsFFjcR8MTCJpV+PlDpGuENvwSX9cnsMtU6NUT1s/LuXi55B8YAjV9
	 6EyzXPYPrtfhg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E281C40382;
	Thu, 19 Nov 2026 21:39:02 +0000 (UTC)
From: Suyuan Wang via B4 Relay <devnull+shyckless.gmail.com@kernel.org>
Date: Thu, 19 Nov 2026 21:39:02 +0000
Subject: [PATCH net] tipc: restore write readiness when a socket's group
 goes away
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
Message-Id: <20261119-tipc-group-open-v1-1-cb725145da51@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHVs/2oC/yWMwQqDMBAFf0X23AVXaKv+SulBt692PSQhiVIQ/
 93YHmdgZqOEaEjUVxtFrJbMuwJyqUg/g5vA9ipMTd3cRKTjbEF5in4J7AMcDxC93ttuFCiVKkS
 87fs7Psgh0/Mv0zLO0Hy+aN8PJ2NuN3gAAAA=
X-Change-ID: 20261119-tipc-group-open-ae1c5789b1ec
To: davem@davemloft.net, kuba@kernel.org, edumazet@kernel.org, 
 jmaloy@redhat.com, pabeni@redhat.com
Cc: horms@kernel.org, tipc-discussion@lists.sourceforge.net, 
 tung.quang.nguyen@est.tech, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795124342; l=3659;
 i=shyckless@gmail.com; s=default; h=from:subject:message-id;
 bh=d+WQVJYdbAe7xs4W7Iq+DJKoNtE/VFiuVnisFS9O1rY=;
 b=1zji59NQqSj+Iubp+nmQx9B8FQKfMd8sXkpS3yVFOcBxV/yVNJqbc6VmHYQKqtKS+PbZY+AjA
 G1xWZIXdo5+AtE3O9rrxhkFCCoZxrgVSgqqERHfpf7SCUkMIfNqB3SH
X-Developer-Key: i=shyckless@gmail.com; a=ed25519;
 pk=pMtccVGiWES3bV+7YBFuBclkvq2n2HBHQ5azaBrK2lY=
X-Endpoint-Received: by B4 Relay for shyckless@gmail.com/default with
 auth_id=1498
X-Original-From: Suyuan Wang <shyckless@gmail.com>
Reply-To: shyckless@gmail.com

From: Suyuan Wang <stevewong@hust.edu.cn>

tipc_group_create() sets tsk->group_is_open to false, and tipc_poll()
only reports EPOLLOUT for a socket in TIPC_OPEN state when that flag is
true. Commit 1b22bcad7e39 ("tipc: correct initial value for group
congestion flag") made sure the flag is true for sockets that never
join a group, since otherwise "SOCK_RDM/DGRAM sockets sending datagrams
never receive POLLOUT".

The flag is not set back when the group goes away again, though:

- tipc_group_create() clears the flag and then fails when the topology
  subscription cannot be created, for example when TIPC_MAX_SUBSCR
  subscriptions exist already;
- tipc_sk_join() deletes the new group when tipc_sk_publish() fails,
  for example when the node's publication limit is reached;
- tipc_sk_leave() deletes the group while the flag may still be false,
  e.g. because of group congestion, or because the group has no other
  members yet.

In all three cases the socket is back to an ordinary RDM/DGRAM socket,
but poll() never reports EPOLLOUT for it again. Before commit
60c253069632 ("tipc: fix race between poll() and setsockopt()"),
tipc_poll() also reported EPOLLOUT when tsk->group was NULL, so
deleting the group was enough; since then the flag has to be reset.

Set tsk->group_is_open to true in these three places, as it is for a
socket that never had a group, and call sk_write_space() so that a
task already waiting for EPOLLOUT is woken up, as tipc_sk_filter_rcv()
does when a group becomes open again.

Found with a static analysis tool and checked by hand.

Fixes: 60c253069632 ("tipc: fix race between poll() and setsockopt()")
Cc: stable@vger.kernel.org
Co-developed-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Kaixuan Li <kaixuan.li@ntu.edu.sg>
Signed-off-by: Suyuan Wang <stevewong@hust.edu.cn>
---
Tested in QEMU (x86_64, KASAN), on next-20261109 (net/tipc/ is the same
as in net):
- empty group, no loopback: JOIN, a thread waits in epoll_wait() for
  EPOLLOUT, then TIPC_GROUP_LEAVE. Before: no EPOLLOUT, the waiter times
  out. After: the waiter is woken and poll() reports POLLOUT.
- 65535 topology subscriptions open, then TIPC_GROUP_JOIN fails with
  -ENOMEM: no POLLOUT before, POLLOUT after.
- bind until the publication limit, then TIPC_GROUP_JOIN fails with
  -EINVAL: no POLLOUT before, POLLOUT after.
---
 net/tipc/socket.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/net/tipc/socket.c b/net/tipc/socket.c
index 65cc0c4964b3..26771a98dc7a 100644
--- a/net/tipc/socket.c
+++ b/net/tipc/socket.c
@@ -3096,8 +3096,12 @@ static int tipc_sk_join(struct tipc_sock *tsk, struct tipc_group_req *mreq)
 	if (grp)
 		return -EACCES;
 	grp = tipc_group_create(net, tsk->portid, mreq, &tsk->group_is_open);
-	if (!grp)
+	if (!grp) {
+		/* tipc_group_create() may have cleared it before failing */
+		tsk->group_is_open = true;
+		tsk->sk.sk_write_space(&tsk->sk);
 		return -ENOMEM;
+	}
 	tsk->group = grp;
 	msg_set_lookup_scope(hdr, mreq->scope);
 	msg_set_nametype(hdr, mreq->type);
@@ -3109,6 +3113,8 @@ static int tipc_sk_join(struct tipc_sock *tsk, struct tipc_group_req *mreq)
 	if (rc) {
 		tipc_group_delete(net, grp);
 		tsk->group = NULL;
+		tsk->group_is_open = true;
+		tsk->sk.sk_write_space(&tsk->sk);
 		return rc;
 	}
 	/* Eliminate any risk that a broadcast overtakes sent JOINs */
@@ -3132,7 +3138,9 @@ static int tipc_sk_leave(struct tipc_sock *tsk)
 	ua.scope = scope;
 	tipc_group_delete(net, grp);
 	tsk->group = NULL;
+	tsk->group_is_open = true;
 	tipc_sk_withdraw(tsk, &ua);
+	tsk->sk.sk_write_space(&tsk->sk);
 	return 0;
 }
 




