Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201141;
	b=tiOYFSfKK9PC5/cbKy68Ev2dUmrZ88w4sKZk2erlpNtkdIqM/6InKWgPklzEDc2k6Qiu
	 Tcyoqr33PEcY+OuWAyUPvafh6bFOgfGzBmhpdjAb23e85q9lZLdYf5kuCKMzlPfDrA6b3
	 udmLtc+zDLI3pk0qMcInSqrJjVE2vSMVx0OnJQodu70RXvRlyOB02VZYYNxyCwTiGfsiI
	 OJ/xl2yeJIpjm8ry+E7syWacPYHBilC1OytV6umS1/Y0fOIN+K6eaSyEuVcZwr6SsBpR3
	 Fsw6dMrF2JNdtrfIqH+k7NuBJx5y0kQB6YY/qML5w3daDD4xui1tsiDZ+F8XetlIpqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201141;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Debian-User;
	bh=V0Xnq0FOQBWZYDR77AlK4AaK0mDrmtXqXDC6pLnOU5g=;
	b=cinwIa4xKKnCS7triRBH4iUxdUgKusaw6qGypsSu8QUXpaATeacfdm1CSYKu44If7tZ7
	 ysAU4Q1X0usJMLf0t4fRyNArB63TB7MDdMrkLqVX56gtGJ9h3ZfzakTikFkt2+dwJK356
	 Jg6VVwHwbj2sLPxQKc+Fp1f5TiOWKbswj4Hj+bQY/Y01pkRN5akVnNU/pr9B/x08V4sD2
	 HqTiMK4F9b36WCaG3R4iOdofPSE7z2d9Z6eIwmKkKR/ykpTFYH+sCNPMos8PQQlhLr71k
	 ZY4vIWjAeBPHkaAOImnKiojMZfa/0eQDUYwqSGABQURjMOZWoRtqc3YqnSQ8z2RiXJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=D1mIge+I;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB5EB60A2619;
	Fri, 20 Nov 2026 18:58:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB5EB60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=D1mIge+I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=V0Xnq0FOQBWZYDR77AlK4AaK0mDrmtXqXDC6pLnOU5g=; b=D1mIge+IL3dpMDGvQpz8zl4/vF
	XX2EhDeLM8xv5Vtcm3ENNfCiK2Hbzsq4ELT9H9l0MbALupv5xAhq7b/UTw4x72A/++i0JgHZublrQ
	TUq//hgO8uPBWdfegMF5GQaU5BDPlPhdmL1zPyg9Ps9o3Ds4TvKDAKlPISOM6oxGsz6RfrqPA9CZB
	dHpHVXpbjA05Lm1xQtTU2AWjNq8OAhHMPl6mBEl5OWpE+pKTYvL2zbJ/xviZSVhW83xaMeGSQvJiG
	1oK/3iQKqQ6N0zYAmkG2s3/1pTcDn9gZEntRnlOfuVKdALPE32NEHjlRb5DSo0TSe7BOVEnbVi6HA
	+cAhRwQA==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xUTou-00355i-2v;
	Fri, 20 Nov 2026 18:58:50 +0000
From: Breno Leitao <leitao@debian.org>
Date: Fri, 20 Nov 2026 10:58:10 -0800
Subject: [PATCH net-next v2] netconsole: harden the enablement through
 configfs.
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
Message-Id: <20261120-netcons_double_cleanup-v2-1-dccfb71e0ddb@debian.org>
X-B4-Tracking: v=1; b=H4sIAEeYAGsC/4XNQQqDMBBA0auEWZuSSau1rnqPIhKTUQMykSSKR
 bx7wQt0/eH9AxJFTwkacUCkzScfGBqhCwF2MjyS9A4aAVrpChG1ZMo2cOpcWPuZOjuT4XWRj3u
 vFGJt0b6gELBEGvx+wR9gypJpz9AWAiafcojf67jh1f/hG0qUrhyGGqsnqdK8HfXe8C3EEdrzP
 H9viRbpxwAAAA==
X-Change-ID: 20261112-netcons_double_cleanup-43b00118c1c9
To: Gustavo Luiz Duarte <gustavold@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.17-dev-ce4c1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2947; i=leitao@debian.org;
 h=from:subject:message-id; bh=1ErBcKrn+Eu10NB6jGW6URjJYn+tadUA77+cHnQZDe0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBrAJhlQjykBXzRvcPtwRgO3otAtbUZPh1riQalg
 D4TT+nrnuqJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCawCYZQAKCRA1o5Of/Hh3
 bX9fD/9CBUoOMb4k8l11bciSweKbOVfILXvHoYFx1smYUseg+wluZ/KQxe+uymwlY3Md+T6G4RW
 GoskHLATPKTO+G0H7vwYlZizleYYXr9syiE7RDerBHHvu0tEcU1lqH6eSmPkS7zCS7F7leM6YSV
 nimRsRfDdwQ14XP96KArSovxCz8JBnccxU+Jii7HGGESeZtuSQ3XBNI/+aAi5Wz2Zxk2hAcXBr6
 X/7mABO0CxOmwAUrZMDe4AOUN/uf2wWcG/uPAw4tEePFkBvvXeuEwjLcjGOS9mJSf48imi4ulPQ
 s1IpgaHFNpE+IdueJnqlLN3LmpQpdLT4+xOKMntswB7r4BLDG88COA7HOsjO7mFh9xG5nhL/RfH
 H51Y9dLGJqw7fMWJEgzqd1yMUwozorfVtRrZNz5PGl8nHmr1YGKuiywpcV9wiLCt2MO+PWC6fX9
 77r/i9085N72wK/4qVjh2UTjLFQEStYWRgE/Vbk7XuEYPcs3fuNtcywPOoMyORD2sk+wsav61Ak
 avPYDFVeFF1igTNzAzkdbFSu/AAbqoaJTE5Vuqc1fPyVwcyDZoYMwMvwVJ/9FI6rVNxlTix+dAn
 t0jO0sdu6GSxmJrWsimddp+S8nJjBhCGOx/CRKqCdK9EEeeckVggzOnFS7vXGNLPTpm2eGGYar8
 vraIrYRZqj6ksIQ==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

There is a possible race when enabling/disabling the target through
configfs with netdev events that can call a null pointer dereference.

My robot was able to come up with a reproducer by adding a bunch of
msleeps() around.

The race is basically this one:

  CPU 0 (enabled_store)             CPU 1 (netconsole_netdev_event)
  current_enabled = true
                                    nt->state = STATE_DEACTIVATED
                                    do_netpoll_cleanup()
                                      np->dev = NULL
  nt->state = STATE_DISABLED
  list_move(&nt->list, &target_cleanup_list)
  do_netpoll_cleanup()
    __netpoll_cleanup(): np->dev->npinfo

And kasan reports:

  KASAN: null-ptr-deref in range [0x0000000000000108-0x000000000000010f]
  RIP: 0010:__netpoll_cleanup
  Call Trace:
   do_netpoll_cleanup
   netconsole_process_cleanups_core
   enabled_store
   configfs_write_iter

The disable path used to call netpoll_cleanup(), which skips a netpoll
without a device, until it started deferring the release to
target_cleanup_list.

Re-check the state under target_list_lock, which the notifier holds when
it stops a target, and queue the target only if it is still enabled.
Mark it disabled either way, as before.

Fixes: 97714695ef90 ("net: netconsole: Defer netpoll cleanup to avoid lock release during list traversal")
Reviewed-by: Gustavo Luiz Duarte <gustavold@gmail.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Given this is not super critical or hardly faced in production, I am
sending this to net-next, even with a 'Fixes:' tag.
---
Changes in v2:
- moved from 'net' to 'net-next' in the tag.
- Link to v1: https://patch.msgid.link/20261112-netcons_double_cleanup-v1-1-d5ff8167e05a@debian.org
---
 drivers/net/netconsole.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/net/netconsole.c b/drivers/net/netconsole.c
index a9f9477da1ec77..4b546194f7179c 100644
--- a/drivers/net/netconsole.c
+++ b/drivers/net/netconsole.c
@@ -1143,11 +1143,10 @@ static ssize_t enabled_store(struct config_item *item,
 		 */
 		mutex_lock(&target_cleanup_list_lock);
 		spin_lock_irqsave(&target_list_lock, flags);
+		/* An interface event may have stopped and released it */
+		if (nt->state == STATE_ENABLED)
+			list_move(&nt->list, &target_cleanup_list);
 		nt->state = STATE_DISABLED;
-		/* Remove the target from the list, while holding
-		 * target_list_lock
-		 */
-		list_move(&nt->list, &target_cleanup_list);
 		spin_unlock_irqrestore(&target_list_lock, flags);
 		mutex_unlock(&target_cleanup_list_lock);
 		netconsole_unregister_console(nt);

---
base-commit: 909ef7a9a30fa139e69e555e3606680f5cca7726
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261112-netcons_double_cleanup-43b00118c1c9

Best regards,
--  
Breno Leitao <leitao@debian.org>

