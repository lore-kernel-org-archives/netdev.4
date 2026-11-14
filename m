Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694554;
	b=tn5UMTHWvGymPEzbcENlc8K4p4v0CXTO2Rb9YP9GRYRhtb6L9BDafMT9MTJ+z2hilkz1
	 Vtyt3NNdGL6hWMv6Jm0AY7Z3C2WWAnB6V4zKYXlmVNNRZA+jwEMq/jEE7lpmUkai1FUN6
	 eIWutipdZ/WALoBHjQx54Rtyyy2BYnlpuAcEUDD8qGw74rsgTkzii9eSMi4Glp9oY/7X6
	 GnpOuHRnAR6oOEmxcbVxAYT7QTBVcm5mFhj4noJ8dNYsR+vKuF9fW4wEi9mmpzqXIAdmi
	 SBf1HKe4bLqDyN4Vaaxq+QsHJ24y6BGLEAgyu/WVOhB4jZVhDojPuM5Ol71TSjefMKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=yoG65OXiXkWQCJFS12NP3/OMELZGoJucnTHxc+Moicc=;
	b=1xixYlcYdzYrGJwHWOgv/RVEZv1w+jYvRvAcb0bWB1NWVmDdu7vd5rqoSBtkAoHfa+Fa
	 SDhvuSiufHaFT5j6lY06l77UyI1nYZM+vr3VzqvdT2P8yYuukgpbzcxtEk+8nxQZqCqJx
	 535NUZrTC9inRYqmLNUA2GpY8f8AviYP2mGSdjVEluLYWcK0K5wBvI06tfNMSOyFMqZSy
	 TTbfH3RHGawoog0wkHkPTlCyFIrx0h33OQYoDQuDuEJNORs3S9z65norS7eB1EyQXqHHr
	 ZjCscl+X5rNNSmGEOz1eT8g9tZ5xWylycXjFR6JlL3eIAMpt3YDndAfYmQ+987QDggA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMImx1uh;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B76606A88F
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 22:15:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31B76606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UMImx1uh
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso3418615e9.0
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 14:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794694552; x=1795299352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yoG65OXiXkWQCJFS12NP3/OMELZGoJucnTHxc+Moicc=;
        b=UMImx1uhnpPgZWwJXeXprNt+VqJnEZ9kx4WELoHGjviyYMtFHwBPhkFgV8S3GKm9IZ
         oN3iCp90hHlJaHunHPOxVMa5BHrqf3xXxOaiWaNJFchIsM2/eW9u6x2KyCu0S99PMiaf
         T3GaZFBs9U2UdOw5TWVm7ECrMS/iy9FV4NW3pAnCIYsBTdvSRs0JtYyZBZjaSSrnqIGG
         Y/GANUc6yHIRHGVjvUeozGTkQxB9Ioote1JuQA6AIRybLNuh9DxILvXotbhhwLVGVRMr
         /oKYNyMha/YdSL+pDwP943wZ7Tj5FjCFCuBJGJllLRXSeo6VUMavaHsv6YIYXzQiV/9h
         8hzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694552; x=1795299352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yoG65OXiXkWQCJFS12NP3/OMELZGoJucnTHxc+Moicc=;
        b=GHopUSFdGYZZVvyq1uIP+6kGUL83qlPGKMceVwQesXksjtAcaKZ/t+42//yEgff2zC
         5Cet6cO5db3Ji23a4cGQYAI7j/WCbH8YmUkt1UBXh9XSpYXDfuGmqSWlbDUFc4wCbqiJ
         GX+7xiwcb9p70fLvbVpN6EZbfdqseC9YqGaPn3crEYU9yy7Cw+leRJrD9/1dmEYhm27V
         8bs108Z5/81ymgObAVZ9Ou0yWA/VTu5/b1DNr6ym7mTUtbpMrXsHHH4wPI57j33jOSgf
         TkW4kVgYcBjIY5KPgBkOAVM3IgdorIdNmkg907KqEh2ZRb3EUfHyPSTBqrYPNRD2htDl
         9yuA==
X-Gm-Message-State: APuU4Z9E4QNZm+PZQ2RTtklql+8VgjSkcxIXrDM8uuhm4Djb4EWoYuIq
	fPR8Q1xzKqg3Aa0FmWHcZGZQ3EGjot7VV26SJHF8Impz3Q4Aaf/FX9cPCAikKQM2gik=
X-Gm-Gg: AYBFou1PchmCPhCK2XxKL3juDxbpWpZb64PajIqdfHJyhru4npS3th0aZ2dVaZ3cRT2
	7VrqBAS1PqjN0e3ovhG9bJlNg5TcLq/j0yAbmDffy39CQPLLEDpaDVhnLY5Krayvjz3/5g9N487
	qSwQKjRPfjzHwTkD8Yhjl+tz2lplxfZHz9oiBX1Vv5KiF6o6VqGtjJyCok376ScV4G8TW+PuuwD
	36gK0L7tCHbELQFuOBvhCy90uHcK5cvVAdgIJBnDhippQN0D00NPFcPIR1U1pcqPR/S6sjuqNwj
	K3VKSLwdmvbPLbdxidynWmNAWUygSNNfilcPvXRNk0Cnaw+3J2vHs7SqGguJ9n3w4pWPmretnBZ
	uBKkCyY74pSH8WXYyEZsnjXMs/rZVt5ZMwDgNYV9A4u9/mecgg2nB3ublqYlXXe3u7shjtVbWpc
	hsv3BT0RmNzRh2WKFZx5/7/dvlPeoh3K4f1gvgoQJv+KD72pwhOxqEOIIHlO5eQzgquCtMH1UF5
	2KXKLbIdpqmOMV8iO/iGFZgVNgt15JFJmkCzyX6OFK74yAEh4eBQThOQxFiWvwLuK6olUEIarxo
	0W3C9VQAOrC2M4b4GEF1noc=
X-Received: by 2002:a05:600c:2784:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb4e2918b1mr188363445e9.2.1794694551566;
        Sat, 14 Nov 2026 14:15:51 -0800 (PST)
Received: from kali ([169.224.126.250])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm13514941f8f.8.2026.11.14.14.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:15:51 -0800 (PST)
From: Ali Firas <alishmery18@gmail.com>
To: netdev@vger.kernel.org,
	idosch@nvidia.com
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	razor@blackwall.org,
	roopa@nvidia.com,
	kuniyu@google.com,
	petrm@nvidia.com,
	aroulin@nvidia.com,
	shuah@kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ali Firas <alishmery18@gmail.com>,
	Weiming Shi <bestswngs@gmail.com>,
	Xiang Mei <xmei5@asu.edu>
Subject: [PATCH net-next v5 6/8] vxlan: vnifilter: roll back a VNI add that fails
Date: Sun, 15 Nov 2026 01:14:10 +0300
Message-ID: <20261114221412.255825-7-alishmery18@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114221412.255825-1-alishmery18@gmail.com>
References: <20261114221412.255825-1-alishmery18@gmail.com>
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

vxlan_vni_add() publishes a new VNI before the steps that can still
fail: the node goes into the VNI rhashtable, the VNI list and, when the
device is up, the per-socket VNI hash. Only then does
vxlan_vni_update_group() install the VNI's default FDB entry and join
its multicast group. If either fails, nothing is undone and
RTM_NEWTUNNEL is sent anyway, so a request that returns an error leaves
behind a VNI that is listed, notified and accepts unicast VXLAN frames,
but has no default entry or no membership. A retry of a VNI that
inherits the device remote, or of one whose join failed, does not repair
it: vxlan_vni_add() then takes the update path, which finds the stored
remote equal to the requested one and returns 0.

Both failures are reachable without memory pressure. Installing the
entry fails with -ENOSPC once the device holds maxaddress FDB entries.
The join fails with -ENOBUFS once the socket holds
net.ipv4.igmp_max_memberships groups (20 by default).

Make installing the entry the last step that can fail, then undo the
publication when it does. On create, vxlan_vni_update_group() now joins
the group first and leaves it again if the entry cannot be installed.
The membership is given back only if this join took it, not when
-EADDRINUSE says the socket already held it. Installing the entry
either succeeds or leaves no FDB state behind: vxlan_fdb_create() frees
what it allocated, and "vxlan: leave FDB state and flags unchanged
when an update fails" covers an append to an existing entry. That leaves
vxlan_vni_add() only the VNI itself to unpublish. It does so with the
helpers vxlan_vni_del() uses, in reverse order of publication. It frees
the node through the same call_rcu(), so an RX or TX lookup that still
holds it under RCU does not see it freed. RTM_NEWTUNNEL is now sent
only on success. Commit aa6ca1c5c338 ("vxlan: vnifilter: send
notification on VNI add") sent it on failure too, because the VNI then
stayed installed; a VNI added without a group or remote still gets it,
as that commit intended.

vxlan_vni_delete_group() is not reused here. Its guard also fires when
only the device has a remote, so on such a device it deletes a default
entry even when installing that entry is what failed. Since
vxlan_fdb_parse() accepts any NDA_SRC_VNI, that entry can be one
installed out of band.

Ido raised the missing rollback in review of a vxlan_igmp_join() fix
(Links below), and the automated review of v4 of this series raised it
again. Both failures were triggered in QEMU on net-next with the limits
above, without modifying the kernel or injecting errors, and showed each
symptom described above.

Tested in QEMU: test_vxlan_vnifiltering.sh gains a case for each failure
later in this series; both fail on net-next and pass on this series,
with and without KASAN and lockdep.

Changing the group of an existing VNI is left as it is. It leaves the
old group before joining the new one, which lets a swap succeed at the
membership limit, so a join that fails there still has the new group
recorded. Fixing that needs a transaction.

This is ordered before "vxlan: vnifilter: account the default FDB entry
to memcg", which makes installing the entry fail routinely at a memory
cgroup limit. It targets net-next, as Jakub suggested in review of the
earlier posting.

Fixes: f9c4bb0b245c ("vxlan: vni filtering support on collect metadata device")
Link: https://lore.kernel.org/netdev/20260323095544.3311285-4-bestswngs@gmail.com/
Link: https://lore.kernel.org/netdev/20260324133449.GA460138@shredder/
Suggested-by: Ido Schimmel <idosch@nvidia.com>
Cc: Weiming Shi <bestswngs@gmail.com>
Cc: Xiang Mei <xmei5@asu.edu>
Signed-off-by: Ali Firas <alishmery18@gmail.com>
---
v5: new patch, ordered before the FDB accounting patch that makes the
failure routine (review of v4 6/7). The missing rollback was noted in
Weiming Shi's vxlan_igmp_join() fix and raised by Ido in its review
(Links); the changelog says what it did in QEMU (sinfo bot). It
supersedes the separately posted rollback series:
https://lore.kernel.org/netdev/20260911215203.3054653-1-alishmery18@gmail.com/
Unlike that posting it carries a Fixes tag, which maintainer-netdev.rst
requires for fixes regardless of the tree.

 drivers/net/vxlan/vxlan_vnifilter.c | 50 +++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 10 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_vnifilter.c b/drivers/net/vxlan/vxlan_vnifilter.c
index 07aa641f16e8..6e896ddf658c 100644
--- a/drivers/net/vxlan/vxlan_vnifilter.c
+++ b/drivers/net/vxlan/vxlan_vnifilter.c
@@ -606,6 +606,7 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 	const struct vxlan_config *cfg = rtnl_dereference(vxlan->cfg);
 	const union vxlan_addr *newrip = NULL, *oldrip = NULL;
 	union vxlan_addr old_remote_ip;
+	bool joined = false;
 	int ret = 0;
 
 	memcpy(&old_remote_ip, &vninode->remote_ip, sizeof(old_remote_ip));
@@ -633,13 +634,31 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 	if (!create && oldrip && newrip && vxlan_addr_equal(oldrip, newrip))
 		return 0;
 
+	/* A new VNI joins its group before its default FDB entry is installed,
+	 * so that installing the entry is the last step that can fail, and a
+	 * failure leaves vxlan_vni_add() only the VNI itself to undo.
+	 */
+	if (create && group && (vxlan->dev->flags & IFF_UP) &&
+	    vxlan_addr_multicast(group)) {
+		ret = vxlan_igmp_join(vxlan, group, 0);
+		if (ret == -EADDRINUSE)
+			ret = 0;
+		else if (!ret)
+			joined = true;
+		if (ret)
+			goto out;
+	}
+
 	ret = vxlan_update_default_fdb_entry(vxlan, vninode->vni,
 					     oldrip, newrip,
 					     cfg->remote_ifindex,
 					     cfg->remote_ifindex,
 					     extack);
-	if (ret)
+	if (ret) {
+		if (joined)
+			vxlan_igmp_leave(vxlan, group, 0);
 		goto out;
+	}
 
 	if (group) {
 		memcpy(&vninode->remote_ip, group, sizeof(vninode->remote_ip));
@@ -647,7 +666,7 @@ static int vxlan_vni_update_group(struct vxlan_dev *vxlan,
 			vxlan_vnifilter_seq_inc(dev_net(vxlan->dev));
 	}
 
-	if (vxlan->dev->flags & IFF_UP) {
+	if (!create && (vxlan->dev->flags & IFF_UP)) {
 		if (vxlan_addr_multicast(&old_remote_ip) &&
 		    !vxlan_group_used(vn, vxlan, vninode->vni,
 				      &old_remote_ip,
@@ -850,6 +869,14 @@ static void vxlan_vni_free(struct vxlan_vni_node *vninode)
 	kfree(vninode);
 }
 
+static void vxlan_vni_node_rcu_free(struct rcu_head *rcu)
+{
+	struct vxlan_vni_node *v;
+
+	v = container_of(rcu, struct vxlan_vni_node, rcu);
+	vxlan_vni_free(v);
+}
+
 static int vxlan_vni_add(struct vxlan_dev *vxlan,
 			 struct vxlan_vni_group *vg,
 			 u32 vni, union vxlan_addr *group,
@@ -889,18 +916,21 @@ static int vxlan_vni_add(struct vxlan_dev *vxlan,
 
 	err = vxlan_vni_update_group(vxlan, vninode, group, true, &changed,
 				     extack);
+	if (err)
+		goto err_unpublish;
 
 	vxlan_vnifilter_notify(vxlan, vninode, RTM_NEWTUNNEL);
 
-	return err;
-}
-
-static void vxlan_vni_node_rcu_free(struct rcu_head *rcu)
-{
-	struct vxlan_vni_node *v;
+	return 0;
 
-	v = container_of(rcu, struct vxlan_vni_node, rcu);
-	vxlan_vni_free(v);
+err_unpublish:
+	if (vxlan->dev->flags & IFF_UP)
+		vxlan_vs_add_del_vninode(vxlan, vninode, true);
+	__vxlan_vni_del_list(vxlan, vg, vninode);
+	rhashtable_remove_fast(&vg->vni_hash, &vninode->vnode,
+			       vxlan_vni_rht_params);
+	call_rcu(&vninode->rcu, vxlan_vni_node_rcu_free);
+	return err;
 }
 
 static int vxlan_vni_del(struct vxlan_dev *vxlan,
-- 
2.53.0

