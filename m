Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795043239;
	b=eBsR7uCcv7lrmMUYOrMPkOgyCkbqCzP8PISNKUbCHG9SOnN2+xAWhaucHMpJM9GwceAw
	 kVjRlNzbjEl9W7O1GYM0KEHkoxPLlGc1b5dxeh1Bmj81JDlwaYBoyJSiY7tkKfmt2nvAE
	 EYOYBhGgO1cDCrXoqRI5Uk+SjD0EyuH6snLJ0uFixSlN41eDHEqZwWUBpRp6wB2Ccrx7O
	 +v6gskyhrg5f5Asw6SrnoSSgWsfT9I+FEJSwXO3yOpv6ssSLzwurkbH4XQHrBczScoZ5v
	 WWzGbu8jgUuPjcGTKxgmUUJau+aqI1Aa6f3Yoze07xk3tSnjBBeH1Ukvd/x8eErKyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795043239;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oPCvHcaH9E9yCdn3Mt8iBQYrWj3O7eF/SMay0a0fOvI=;
	b=Of1bxSIYe2WzLoey77cAFDyL9YSEZMNsICBOinhytMT2Lv1Ka7hSqT+5cb4/9+WZ/lSu
	 BhM0990pdCzMxwu1lmOnEZElWbYyMJTF/fz0API3mOgLB8g2jabI7Ssoifcg/KmOJCxM4
	 +vjy3kWYTtJZPrwhtK+0whWldQKAr2JZ+L4h+MQgv44rHGAfpzN0BzOTGRZD2OVm2oIEy
	 eTzkne5fjFdpHX01RCoS9iPHJOdfMsXt+jRcNtfnlVUUIOWmNnOsR52TMdifK4T1h5Wo7
	 xnroQzyDL/zRMKQM+oRmNN0yk1ZzVrXnwRdtp423dj1HBgzkzObLd8nVSh1fLUea4TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dplhhF9h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2882606A320
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 23:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dplhhF9h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A851F000C4;
	Wed, 18 Nov 2026 23:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795043239;
	bh=oPCvHcaH9E9yCdn3Mt8iBQYrWj3O7eF/SMay0a0fOvI=;
	h=From:To:Cc:Subject:Date;
	b=dplhhF9hf80Ns6FtWyUtV2Vlfn5lQG+hou2igKDTeWJNnGiay8M/xjjjIDPF0FRHb
	 sU3FDf6+TLe80/PairaS4aEfl4E0Qn7aLX/44marxUflu51vlQhCm4UBgQ5HYD/Mle
	 +z2xa9NCtSi/xzccnFLJHuF5amRdqZ3IYjWkG0FIAWroV+7OCevCsMEa8yA+okANTU
	 5HcncRwXYRxGF/raOWDV+N7KEl4u8KleyxL+CCtrTvKTrDDTMlHnjTQE66Gnqjf5/i
	 c7CW0aO9uCe/yzswzoLEo/W8amU3UN8993asjBwuLnSjsuTH/BXj+KrribKqtcZtzv
	 SYEUCND9Kcvcg==
From: Eric Dumazet <edumazet@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Steffen Klassert <steffen.klassert@secunet.com>
Subject: [PATCH net-next] xfrm: remove three registration spinlocks
Date: Thu, 19 Nov 2026 00:07:15 +0100
Message-ID: <20261118230715.1630439-1-edumazet@kernel.org>
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

xfrm_state_afinfo[], xfrm_translator and xfrm_mode_cbs_map[] are
RCU protected pointers which are only written when a module or an
address family registers or unregisters itself. All their readers
already use rcu_read_lock() and rcu_dereference(), and the unregister
functions already call synchronize_rcu().

Each of them has a dedicated spinlock which only serializes these
rare writers:

- xfrm_state_afinfo_lock and xfrm_translator_lock make "install if
  the slot is empty" and "clear if the slot is ours" atomic. Use
  cmpxchg() instead. The return values are unchanged: -EEXIST if the
  slot is already used at registration, -EINVAL when unregistering
  while another object is installed, 0 otherwise.

- xfrm_mode_cbs_map_lock protects nothing: registration overwrites
  the slot and unregistration clears it, both unconditionally. Remove
  it, the existing behavior is kept.

Tested with the xfrm_policy.sh and xfrm_state.sh selftests. The
translator code was only compile tested, with
CONFIG_XFRM_USER_COMPAT=y, and the unregister paths were not
exercised. sparse (C=2) reports no warning.

Signed-off-by: Eric Dumazet <edumazet@kernel.org>
Cc: Steffen Klassert <steffen.klassert@secunet.com>
---
 net/xfrm/xfrm_state.c | 60 ++++++++++++++-----------------------------
 1 file changed, 19 insertions(+), 41 deletions(-)

diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index 0555e5d796ede417ccaca21c998a0434f7146a21..0c02a5f06225f650c7e45a5399cf828769fd455f 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -221,7 +221,6 @@ static void xfrm_hash_resize(struct work_struct *work)
 	xfrm_hash_free(oseq, osize);
 }
 
-static DEFINE_SPINLOCK(xfrm_state_afinfo_lock);
 static struct xfrm_state_afinfo __rcu *xfrm_state_afinfo[NPROTO];
 
 static DEFINE_SPINLOCK(xfrm_state_gc_lock);
@@ -534,16 +533,13 @@ static const struct xfrm_mode *xfrm_get_mode(unsigned int encap, int family)
 }
 
 static const struct xfrm_mode_cbs  __rcu *xfrm_mode_cbs_map[XFRM_MODE_MAX];
-static DEFINE_SPINLOCK(xfrm_mode_cbs_map_lock);
 
 int xfrm_register_mode_cbs(u8 mode, const struct xfrm_mode_cbs *mode_cbs)
 {
 	if (mode >= XFRM_MODE_MAX)
 		return -EINVAL;
 
-	spin_lock_bh(&xfrm_mode_cbs_map_lock);
 	rcu_assign_pointer(xfrm_mode_cbs_map[mode], mode_cbs);
-	spin_unlock_bh(&xfrm_mode_cbs_map_lock);
 
 	return 0;
 }
@@ -554,9 +550,7 @@ void xfrm_unregister_mode_cbs(u8 mode)
 	if (mode >= XFRM_MODE_MAX)
 		return;
 
-	spin_lock_bh(&xfrm_mode_cbs_map_lock);
 	RCU_INIT_POINTER(xfrm_mode_cbs_map[mode], NULL);
-	spin_unlock_bh(&xfrm_mode_cbs_map_lock);
 	synchronize_rcu();
 }
 EXPORT_SYMBOL(xfrm_unregister_mode_cbs);
@@ -3017,7 +3011,6 @@ static bool km_is_alive(const struct km_event *c)
 }
 
 #if IS_ENABLED(CONFIG_XFRM_USER_COMPAT)
-static DEFINE_SPINLOCK(xfrm_translator_lock);
 static struct xfrm_translator __rcu *xfrm_translator;
 
 struct xfrm_translator *xfrm_get_translator(void)
@@ -3044,31 +3037,22 @@ EXPORT_SYMBOL_GPL(xfrm_put_translator);
 
 int xfrm_register_translator(struct xfrm_translator *xtr)
 {
-	int err = 0;
-
-	spin_lock_bh(&xfrm_translator_lock);
-	if (unlikely(xfrm_translator != NULL))
-		err = -EEXIST;
-	else
-		rcu_assign_pointer(xfrm_translator, xtr);
-	spin_unlock_bh(&xfrm_translator_lock);
+	if (cmpxchg(&xfrm_translator, NULL, RCU_INITIALIZER(xtr)))
+		return -EEXIST;
 
-	return err;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(xfrm_register_translator);
 
 int xfrm_unregister_translator(struct xfrm_translator *xtr)
 {
+	struct xfrm_translator __rcu *old;
 	int err = 0;
 
-	spin_lock_bh(&xfrm_translator_lock);
-	if (likely(xfrm_translator != NULL)) {
-		if (rcu_access_pointer(xfrm_translator) != xtr)
-			err = -EINVAL;
-		else
-			RCU_INIT_POINTER(xfrm_translator, NULL);
-	}
-	spin_unlock_bh(&xfrm_translator_lock);
+	old = cmpxchg(&xfrm_translator, RCU_INITIALIZER(xtr), NULL);
+	if (old && old != RCU_INITIALIZER(xtr))
+		err = -EINVAL;
+
 	synchronize_rcu();
 
 	return err;
@@ -3156,36 +3140,30 @@ EXPORT_SYMBOL(xfrm_unregister_km);
 
 int xfrm_state_register_afinfo(struct xfrm_state_afinfo *afinfo)
 {
-	int err = 0;
-
 	if (WARN_ON(afinfo->family >= NPROTO))
 		return -EAFNOSUPPORT;
 
-	spin_lock_bh(&xfrm_state_afinfo_lock);
-	if (unlikely(xfrm_state_afinfo[afinfo->family] != NULL))
-		err = -EEXIST;
-	else
-		rcu_assign_pointer(xfrm_state_afinfo[afinfo->family], afinfo);
-	spin_unlock_bh(&xfrm_state_afinfo_lock);
-	return err;
+	if (cmpxchg(&xfrm_state_afinfo[afinfo->family], NULL,
+		    RCU_INITIALIZER(afinfo)))
+		return -EEXIST;
+
+	return 0;
 }
 EXPORT_SYMBOL(xfrm_state_register_afinfo);
 
 int xfrm_state_unregister_afinfo(struct xfrm_state_afinfo *afinfo)
 {
+	struct xfrm_state_afinfo __rcu *old;
 	int err = 0, family = afinfo->family;
 
 	if (WARN_ON(family >= NPROTO))
 		return -EAFNOSUPPORT;
 
-	spin_lock_bh(&xfrm_state_afinfo_lock);
-	if (likely(xfrm_state_afinfo[afinfo->family] != NULL)) {
-		if (rcu_access_pointer(xfrm_state_afinfo[family]) != afinfo)
-			err = -EINVAL;
-		else
-			RCU_INIT_POINTER(xfrm_state_afinfo[afinfo->family], NULL);
-	}
-	spin_unlock_bh(&xfrm_state_afinfo_lock);
+	old = cmpxchg(&xfrm_state_afinfo[family], RCU_INITIALIZER(afinfo),
+		      NULL);
+	if (old && old != RCU_INITIALIZER(afinfo))
+		err = -EINVAL;
+
 	synchronize_rcu();
 	return err;
 }
-- 
2.53.0

