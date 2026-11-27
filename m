Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801422;
	b=O6cSLXuv3uKik99BDolnsFvJkdsLHqI/Nk/BXe2Vgm/8D/8iBoA+tx7OGdApGCZs2tMj
	 JwhhZe1yS1Jf5pssFr8MXb4ZU3BXSf98P/gjmsEfuMJE3btfIGusoN0z430/ebKRm/+eL
	 ZvGElqJLwZHmZYDj8m08kj1KyjvkQQ/0Cie1ChzE/2fiULk0XpU9WBBvHQTEyyVRw/COS
	 /qEDs3VkESwRSps7LKDxI28iaFo6NsPhr/H755QPj2KvNBrIVRsuvPCJo6/maTup6WMUi
	 hXPIQBUYOXS225UZnaBADobB03tPVuqGLDdzxSXTB2jfVioShyUZFRlunCkrRP0/SJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801422;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=N+uXGWbJZRt6eSh4cKc53z8z0zw0UlnJSiqMVuyy8Wo=;
	b=N3tWjntsPx53AL2RBtEH5n6NEQKbfqG25MXeVml5yv3mjKwCSgMw/4xNtgv7n6tOyyss
	 e49708DiM5lfKQPPQ6YtWfdhC30i7ndeKcn9D+y7HNML5O7W32Eic9clvZK2Bp55x63sI
	 pq7fl8+9iYfnuwUiUceGSdH/XFmk6aCXDIPUxziV3dgo1JQaL9DEsYY4VsRMqdQwBMWR/
	 NmK9ivqVQcEuVCvVP8DdLaZUIjj9XhQ2iXdOyeg68sdeR5hRkgg7HZsZnsByIoRrcp3hE
	 NvjMFUqqgOtjt9T7uIKD7BAObXnoUr+kotMCS3MwEhQb1Ck00VfBcuQGfL+p+TT8PEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQk9nWeu;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77755606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77755606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQk9nWeu
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38644aedba1so12801096eec.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795801421; x=1796406221; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N+uXGWbJZRt6eSh4cKc53z8z0zw0UlnJSiqMVuyy8Wo=;
        b=yQk9nWeuaeMQA28p+KJm2+cYW2/jLvSxLKGkFDkuQtBzBeGD7KgBKSTqwD9wbAgvtY
         T8RXSgfAYIRop35kNrk9yi4Ge3lK5r6h+4y3KWGcvqNvuki1UMlii80K88Hav0MFl6MD
         u/+s68LLUzeH5QQ/lc7T7n7LvLNOH32qTAdPUhASpJLeeUxvcZNVTjiADZuUWHfroCd6
         SUmVLgD+Z0zsVITEBdmAAuUjeugT/hzTcXJYmFQ7HkltsCHq6hSO+wCduFkTN0y/2wxZ
         nCtIAPvg3LZYgwKzSOOyzp4hktabbwXBWbtOLG9PlC2WrogVN8Ai8kjAGL+6Z/m2dCmP
         vCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801421; x=1796406221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N+uXGWbJZRt6eSh4cKc53z8z0zw0UlnJSiqMVuyy8Wo=;
        b=NmDyFDd3Q2QOYACD2SBmLMNMtOGZyuSPzi1Caik+V6g1mmepBrbBFMBUlsif4iJgqe
         sedUidkI3+mwrfRekdWP+zMaUN7th8IaZy+BTHEPw9zTWtcADaWOLyKwna1aMGczYcoE
         BSlXySFeoJE8hs0o2uXD6B2NHPQ+BsMbBdk7VYghdICxc+E5NYbIlGhshhrtPcstkIXz
         QnCfB/ui2HH1aGLrFRv6fk1kuBbtsAJ1eMEDdm+DoRD6KWYSy7os76xy0ftVCklnhnFi
         HBPx3CGSHw+mfF14bii+dWrSdKnizPfuO+Fc3JR99NhZxlFe20MHOC5WpwobNuw5Qm0g
         vLDQ==
X-Gm-Message-State: APuU4Z9Uej9KgQ7CfRpGDTK5NBpBXaSfwcQ/SKZmV1bBCm5BafHt60NE
	CEftL12omBr2Rcp1sMBxoGUSsn51hln3DoHAx2OE2luh/ArSh2tt4iFD14is5J4cnKI=
X-Gm-Gg: AZFdTZfj5WHnr8cUH1jfeuzFUV5UMOdbNdc7tRm6T+lQk8kujSsE3HldheoTMQFfZhK
	5YIK8E8icyCnFfmdjTTgBCbqUgAlnentYveQNVNtBq3Ws5fFneBCnXsj9COs12l0LNC9M7IcUvK
	8P10Q95X963lFKlwdD5oZPk6YXZXoeyiFt7piCMU44Dfns7FohCG+a4KTtWQvwVsqpa+Rrhm4Cz
	IjZf09Q81GBD8ftTUiKAgamJDGbOb3EOMb05RtWKprcOkD1pF9p/4r5Lal2v6Z/jGQpiiQ4dUD9
	1G85w+y/O931w9CoQiPAhLb+/nuun0lq3l4B7m6hoxn6VX7lXKIA/sySEc/keIaJEzyUUF81jno
	4b6eTYurU2loy440L0xUPYQSTWeCRF82T9pzGcP5nyREVV7uPhUSX6TxBI2Uyp66O4zUyUaK2j/
	qv89Oas5ClA6w/VyUPQ9a7lmmSyWGu2QTly3Z0DttaylObF1p9S+fBvZJ7RNmbsslBe5AP/rWto
	elzGGVitP6FWk0ATlRuvmlI2UdJYjwZsJUWjlQOLSiwA5hxok2zgHS/iZvjQ5sJDT/wnLGbd/fb
	qTP5FJPpEJRieN9CSQdGRNflxrxdw5pyKA1LCQTuRfxpjf9BNUHr6MD2KYwInr3dSskIEonrdEn
	P1trX
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr23005425eec.11.1795801421285;
        Fri, 27 Nov 2026 09:43:41 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm66064276eec.8.2026.11.27.09.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:43:40 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: aconole@redhat.com,
	davem@davemloft.net,
	dev@openvswitch.org,
	echaudro@redhat.com,
	edumazet@kernel.org,
	horms@kernel.org,
	i.maximets@ovn.org,
	i.maximets@redhat.com,
	jhs@mojatatu.com,
	kuba@kernel.org,
	linux-kselftest@vger.kernel.org,
	matttbe@kernel.org,
	netdev-bot+sashiko@kernel.org,
	pabeni@redhat.com,
	shuah@kernel.org,
	stable@vger.kernel.org,
	willemb@google.com
Subject: [PATCH net v7 2/3] net: openvswitch: do not record user features when the change fails
Date: Fri, 27 Nov 2026 12:43:14 -0500
Message-ID: <20261127173039.ovs-features-v7-3-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
References: <20261127173039.ovs-features-v7-1-houminxi@gmail.com>
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

ovs_dp_change() stores the new features in dp->user_features before it
updates the per-cpu upcall port IDs, and that update fails when the
per-cpu-pids attribute is empty or its length is not a multiple of four.
The update runs only when the same request also sets
OVS_DP_F_DISPATCH_UPCALL_PER_CPU, which is what user space that wants
per-cpu upcalls sends.
The request returns -EINVAL with the new features already recorded, while
the code that enables or disables the tc skb extension key never ran.

The datapath then claims TC_RECIRC_SHARING without holding the reference
the bit stands for. A later request that clears the bit drops a
reference that was never taken, and a datapath destroyed with the bit
clear never drops the one it did take. The key is shared with the other
users of recirc sharing, so the count can reach zero while one of them
still reads it, and a disable on a count of zero warns from
static_key_dec_not_one(), which panics a host that runs with
panic_on_warn.

The request only needs CAP_NET_ADMIN, which a user namespace that owns a
network namespace provides. datapath_policy has no entry for
OVS_DP_ATTR_PER_CPU_PIDS and the operation skips strict validation, so an
empty attribute reaches the check that fails.

Record the features last, in one setter that also takes and drops the
reference, and use it from every place that changes or clears the bit.
Two of those places leaked a reference: a datapath that fails after
ovs_dp_change() enabled the key was freed without a disable, and
ovs_dp_reset_user_features() cleared the bit without one. The reset runs
when an outdated user space instance sends OVS_DP_CMD_NEW for a name that
already exists. Clearing the bit there drops this datapath's reference to
a kernel wide key. Other holders keep the key enabled, so this datapath's
packets keep using the tc skb extension; what was lost is the reference,
and the count no longer matches the number of holders.

__dp_destroy() clears the bit before the ports are detached and before the
datapath leaves the list, so an upcall can still be reading the other bits
from the receive path, and the clear goes through the same setter.

Reported-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
Link: https://lore.kernel.org/netdev/998d522f-e61d-420f-9834-6bdcbaab1361@kernel.org/
Fixes: 35d39fecbc24 ("net/sched: Enable tc skb ext allocation on chain miss only when needed")
Cc: stable@vger.kernel.org
Signed-off-by: Minxi Hou <houminxi@gmail.com>
---

v7: two corrections from Sashiko.

The commit message said that after the reset the datapath's packets no
longer share the tc skb extension. The key is kernel wide: clearing the bit
drops this datapath's reference, and other holders keep the key enabled, so
the packet path is unaffected and the loss is the reference itself.

The comment on ovs_dp_set_user_features() claimed the WRITE_ONCE() covers
every lockless reader. Only this helper and queue_userspace_packet() are
marked; ovs_dp_process_packet(), output_userspace() and
ovs_vport_get_upcall_portids() still use a plain load on an aligned u32 and
test one bit. The comment and the @user_features kernel-doc now say that.

 net/openvswitch/datapath.c | 56 +++++++++++++++++++++++++++++---------
 net/openvswitch/datapath.h | 10 ++++++-
 2 files changed, 52 insertions(+), 14 deletions(-)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 8124b298c75f..b463031643b3 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -1712,6 +1712,38 @@ static struct datapath *lookup_datapath(struct net *net,
 	return dp ? dp : ERR_PTR(-ENODEV);
 }
 
+/* Called with ovs_mutex, which every writer holds. The store is a single
+ * WRITE_ONCE() because the field is read without a lock from the packet path;
+ * this helper reads it with READ_ONCE() for the same reason. Readers that
+ * still use a plain load -- ovs_dp_process_packet(), output_userspace() and
+ * ovs_vport_get_upcall_portids() -- read the u32 once and test one bit, so
+ * they are not marked here. The store happens before the reference is taken
+ * or dropped, the order ovs_dp_change() used.
+ */
+static void ovs_dp_set_user_features(struct datapath *dp, u32 features)
+{
+	u32 previous = READ_ONCE(dp->user_features);
+	bool was = previous & OVS_DP_F_TC_RECIRC_SHARING;
+	bool now = features & OVS_DP_F_TC_RECIRC_SHARING;
+
+	WRITE_ONCE(dp->user_features, features);
+
+	if (now && !was)
+		tc_skb_ext_tc_enable();
+	else if (!now && was)
+		tc_skb_ext_tc_disable();
+}
+
+/* Give up the reference for the recirc bit without touching the other bits, so
+ * an upcall that is reading them keeps seeing what it saw.
+ */
+static void ovs_dp_clear_recirc_sharing(struct datapath *dp)
+{
+	u32 features = READ_ONCE(dp->user_features);
+
+	ovs_dp_set_user_features(dp, features & ~OVS_DP_F_TC_RECIRC_SHARING);
+}
+
 static void ovs_dp_reset_user_features(struct sk_buff *skb,
 				       struct genl_info *info)
 {
@@ -1724,7 +1756,7 @@ static void ovs_dp_reset_user_features(struct sk_buff *skb,
 
 	pr_warn("%s: Dropping previously announced user features\n",
 		ovs_dp_name(dp));
-	dp->user_features = 0;
+	ovs_dp_set_user_features(dp, 0);
 }
 
 static int ovs_dp_set_upcall_portids(struct datapath *dp,
@@ -1781,7 +1813,7 @@ u32 ovs_dp_get_upcall_portid(const struct datapath *dp, uint32_t cpu_id)
 
 static int ovs_dp_change(struct datapath *dp, struct nlattr *a[])
 {
-	u32 user_features = 0, old_features = dp->user_features;
+	u32 user_features = 0;
 	int err;
 
 	if (a[OVS_DP_ATTR_USER_FEATURES]) {
@@ -1809,9 +1841,7 @@ static int ovs_dp_change(struct datapath *dp, struct nlattr *a[])
 			return err;
 	}
 
-	dp->user_features = user_features;
-
-	if (dp->user_features & OVS_DP_F_DISPATCH_UPCALL_PER_CPU &&
+	if (user_features & OVS_DP_F_DISPATCH_UPCALL_PER_CPU &&
 	    a[OVS_DP_ATTR_PER_CPU_PIDS]) {
 		/* Upcall Netlink Port IDs have been updated */
 		err = ovs_dp_set_upcall_portids(dp,
@@ -1820,12 +1850,7 @@ static int ovs_dp_change(struct datapath *dp, struct nlattr *a[])
 			return err;
 	}
 
-	if ((dp->user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
-	    !(old_features & OVS_DP_F_TC_RECIRC_SHARING))
-		tc_skb_ext_tc_enable();
-	else if (!(dp->user_features & OVS_DP_F_TC_RECIRC_SHARING) &&
-		 (old_features & OVS_DP_F_TC_RECIRC_SHARING))
-		tc_skb_ext_tc_disable();
+	ovs_dp_set_user_features(dp, user_features);
 
 	return 0;
 }
@@ -1947,6 +1972,8 @@ static int ovs_dp_cmd_new(struct sk_buff *skb, struct genl_info *info)
 err_destroy_portids:
 	kfree(rcu_dereference_raw(dp->upcall_portids));
 err_unlock_and_destroy_meters:
+	/* The datapath is freed here and never reaches __dp_destroy(). */
+	ovs_dp_clear_recirc_sharing(dp);
 	ovs_unlock();
 	ovs_meters_exit(dp);
 err_destroy_ports:
@@ -1969,8 +1996,11 @@ static void __dp_destroy(struct datapath *dp)
 	struct flow_table *table = &dp->table;
 	int i;
 
-	if (dp->user_features & OVS_DP_F_TC_RECIRC_SHARING)
-		tc_skb_ext_tc_disable();
+	/* Only the recirc bit goes here. The datapath is still on the list and
+	 * its ports are still attached, so an upcall can be reading the other
+	 * bits from the receive path while this runs.
+	 */
+	ovs_dp_clear_recirc_sharing(dp);
 
 	for (i = 0; i < DP_VPORT_HASH_BUCKETS; i++) {
 		struct vport *vport;
diff --git a/net/openvswitch/datapath.h b/net/openvswitch/datapath.h
index 7a7afaeceee5..b041a95b203f 100644
--- a/net/openvswitch/datapath.h
+++ b/net/openvswitch/datapath.h
@@ -76,7 +76,15 @@ struct dp_nlsk_pids {
  * ovs_mutex and RCU.
  * @stats_percpu: Per-CPU datapath statistics.
  * @net: Reference to net namespace.
- * @user_features: Bitmap of enabled %OVS_DP_F_* features.
+ * @user_features: Bitmap of enabled %OVS_DP_F_* features.  A datapath
+ * that has %OVS_DP_F_TC_RECIRC_SHARING set holds one reference to the tc
+ * skb extension, so this is a reference count on a kernel wide key rather
+ * than a switch for the datapath's own packet path: the bit can be cleared
+ * while the key stays enabled for other holders.
+ * ovs_dp_set_user_features() keeps the bit and the reference in step, and
+ * every change goes through it with ovs_mutex held.  ovs_dp_change() calls
+ * it after the per-cpu pid update, which can fail, so a request that fails
+ * leaves the features alone.
  * @max_headroom: The maximum headroom of all vports in this datapath; it will
  * be used by all the internal vports in this dp.
  * @meter_tbl: Meter table.
-- 
2.56.1

