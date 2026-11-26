Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795725174;
	b=Zxp8aB/DwFfotOV6saYBNpmWhY1lxt4+UogLZ3CHTOZJVtoJLPQjHqVqqdxXNwuU52n+
	 0PSdZoDd9NP2ms45P001/ZWoQsBcnN4pqrPZ4qLgqEqZAh+H/54cHg43qroxGdIrNzmNB
	 4OvChbOSLFKv0IeYmgIjyufPtO4npeCBWGR/njFQZXoNlLZVUWPX5b8DOgz5c1LIXroiP
	 vDE7VmWD0ehf4SRKeTXIsSM+RaanlpD2jKJUuORiw/V1fuJumNfs7Z9hfFtWxIgN4mCtH
	 a6R9tZM7Tws/8jkkQPyjXkgVPK4vePS25r7Xl9XziSmgVIRY5GdjdNYdqg3kvlYAyog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795725174;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=NIxE4m8l1izRwK6ahSUGuo2vdx0Q2NKrDP6SB3rfqu0=;
	b=BZObZyDjjjmvkYH18NEs4Su0aCNZ/ZnZZWM6RWMX+yNCW1rWwtk6sJNM5oR72uXG1okn
	 2q5QSvjH0XxTzMQBoJkwjLJPGk3wwx4mvSK2QIi5yZp/rRv1zO8jqwtn+jQLak4CIpgDD
	 kxfh8JDi7ojrPvjyG3wYDPblvePq5DPGLXchkeH3Csm8I7kMmUpXiMV6fXod6KDaQMSBv
	 SwlUk6UWvBQjZHJwZPQv65626SQoOmc0ATOYjwZ6u1klTpZZ4Fx9QMQQxcvhKsx6DgKuB
	 rc7tC6MN1/lkkDZvDrB1jNalsPKpMUee8HcETMRBpR4lsqwOq3tr/1WIsHXxhCxi1bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XWtYPhRG;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19687606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 20:32:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19687606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XWtYPhRG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795725174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NIxE4m8l1izRwK6ahSUGuo2vdx0Q2NKrDP6SB3rfqu0=;
	b=XWtYPhRGzEdPBpPRc0gq9lQrf28UO7fOM7c9VFw3cALZYwV+7gTQPt9EjLglOFtcRmVpgc
	tfYKYdtnX7hdH32BhRuoJm/4p2/8nkmPYKFnycJ7EcflZcLLPybpgOAFiUHObdPMyld2wB
	IU499in3+f8sO5JTp8nv/+4noWTrxx4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-85-wPBfipf-POCTfNY6iEcjow-1; Thu,
 26 Nov 2026 20:32:50 +0000
X-MC-Unique: wPBfipf-POCTfNY6iEcjow-1
X-Mimecast-MFC-AGG-ID: wPBfipf-POCTfNY6iEcjow_1795725168
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6D032180057E;
	Thu, 26 Nov 2026 20:32:47 +0000 (UTC)
Received: from ivecera-thinkpadp16vgen1.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DD006180197A;
	Thu, 26 Nov 2026 20:32:40 +0000 (UTC)
From: Ivan Vecera <ivecera@redhat.com>
To: netdev@vger.kernel.org
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Richard Cochran <richardcochran@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	Min Li <min.li@microchip.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Karol Kolacinski <karol.kolacinski@intel.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Petr Oros <poros@redhat.com>
Subject: [PATCH RFC net-next 01/19] dpll: add pin links
Date: Thu, 26 Nov 2026 21:32:13 +0100
Message-ID: <20261126203231.934632-2-ivecera@redhat.com>
In-Reply-To: <20261126203231.934632-1-ivecera@redhat.com>
References: <20261126203231.934632-1-ivecera@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

A pin is a pad of the chip whose driver registers it. When a board wires
a pad of one chip to a pad of another, for example an output of an
external DPLL to the TX reference input of a network controller, a
driver now registers the pin of the other driver with its own DPLL. The
pin then has two owners and a request about it runs callbacks of both
drivers.

Add a link that describes such a wire instead. A driver adds it to its
own pin with dpll_pin_link_add() and names the pin at the other end by
its firmware node, which the driver of that pin sets with
dpll_pin_fwnode_set(). The link holds only the firmware node, so the
driver needs no pointer to a pin of another driver and that pin does not
have to exist yet.

Links are added before the pin is registered and are released together
with the pin. Adding an existing link returns -EEXIST, also on a
registered pin, so each user of a shared pin can add the same link. The
next patch reports links to user space.

Signed-off-by: Ivan Vecera <ivecera@redhat.com>
---
 drivers/dpll/dpll_core.c | 71 ++++++++++++++++++++++++++++++++++++++++
 drivers/dpll/dpll_core.h | 12 +++++++
 include/linux/dpll.h     |  2 ++
 3 files changed, 85 insertions(+)

diff --git a/drivers/dpll/dpll_core.c b/drivers/dpll/dpll_core.c
index 277692d12d3d1e..4d871542ddf762 100644
--- a/drivers/dpll/dpll_core.c
+++ b/drivers/dpll/dpll_core.c
@@ -147,6 +147,16 @@ static void __dpll_pin_hold(struct dpll_pin *pin, dpll_tracker *tracker)
 static void dpll_pin_idx_free(u32 pin_idx);
 static void dpll_pin_prop_free(struct dpll_pin_properties *prop);
 
+static void dpll_pin_links_free(struct dpll_pin *pin)
+{
+	struct dpll_pin_link *link, *tmp;
+
+	list_for_each_entry_safe(link, tmp, &pin->links, list) {
+		fwnode_handle_put(link->peer);
+		kfree(link);
+	}
+}
+
 static void __dpll_pin_put(struct dpll_pin *pin, dpll_tracker *tracker)
 {
 	dpll_pin_tracker_free(pin, tracker);
@@ -155,6 +165,7 @@ static void __dpll_pin_put(struct dpll_pin *pin, dpll_tracker *tracker)
 		xa_destroy(&pin->dpll_refs);
 		xa_destroy(&pin->parent_refs);
 		xa_destroy(&pin->ref_sync_pins);
+		dpll_pin_links_free(pin);
 		dpll_pin_prop_free(&pin->prop);
 		fwnode_handle_put(pin->fwnode);
 		dpll_pin_idx_free(pin->pin_idx);
@@ -665,6 +676,7 @@ dpll_pin_alloc(u64 clock_id, u32 pin_idx, struct module *module,
 	if (ret)
 		goto err_pin_prop;
 	refcount_set(&pin->refcount, 1);
+	INIT_LIST_HEAD(&pin->links);
 	xa_init_flags(&pin->dpll_refs, XA_FLAGS_ALLOC);
 	xa_init_flags(&pin->parent_refs, XA_FLAGS_ALLOC);
 	xa_init_flags(&pin->ref_sync_pins, XA_FLAGS_ALLOC);
@@ -838,6 +850,65 @@ struct dpll_pin *fwnode_dpll_pin_find(struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL_GPL(fwnode_dpll_pin_find);
 
+static bool dpll_pin_has_link(const struct dpll_pin *pin,
+			      const struct fwnode_handle *peer)
+{
+	struct dpll_pin_link *link;
+
+	list_for_each_entry(link, &pin->links, list)
+		if (link->peer == peer)
+			return true;
+
+	return false;
+}
+
+/**
+ * dpll_pin_link_add - add a link from a pin to another pin
+ * @pin: pointer to a dpll pin
+ * @peer: firmware node of the pin at the other end
+ *
+ * Describe a fixed board connection between @pin and the pin of another
+ * device that its driver associates with @peer by dpll_pin_fwnode_set().
+ * The other pin does not need to exist yet. The link is kept until @pin is
+ * released. An existing link is reported also when @pin is registered, so
+ * each user of a shared pin can add the same link.
+ *
+ * Context: Acquires a lock (dpll_lock). Must be called before @pin is
+ *	    registered.
+ * Return:
+ * * 0 on success
+ * * -EEXIST if @pin already has a link to @peer
+ * * -EBUSY if @pin is already registered
+ * * -ENOMEM if the link cannot be allocated
+ */
+int dpll_pin_link_add(struct dpll_pin *pin, struct fwnode_handle *peer)
+{
+	struct dpll_pin_link *link;
+	int ret = 0;
+
+	mutex_lock(&dpll_lock);
+	if (dpll_pin_has_link(pin, peer)) {
+		ret = -EEXIST;
+		goto unlock;
+	}
+	if (WARN_ON(xa_get_mark(&dpll_pin_xa, pin->id, DPLL_REGISTERED))) {
+		ret = -EBUSY;
+		goto unlock;
+	}
+	link = kzalloc_obj(*link);
+	if (!link) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+	link->peer = fwnode_handle_get(peer);
+	list_add_tail(&link->list, &pin->links);
+unlock:
+	mutex_unlock(&dpll_lock);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(dpll_pin_link_add);
+
 static int
 __dpll_pin_register(struct dpll_device *dpll, struct dpll_pin *pin,
 		    const struct dpll_pin_ops *ops, void *priv, void *cookie)
diff --git a/drivers/dpll/dpll_core.h b/drivers/dpll/dpll_core.h
index da8a369556ed11..26a16df2b6410d 100644
--- a/drivers/dpll/dpll_core.h
+++ b/drivers/dpll/dpll_core.h
@@ -47,6 +47,7 @@ struct dpll_device {
  * @module:		module of creator
  * @module_name:	module name of creator
  * @fwnode:		optional reference to firmware node
+ * @links:		links to other pins (struct dpll_pin_link)
  * @dpll_refs:		hold referencees to dplls pin was registered with
  * @parent_refs:	hold references to parent pins pin was registered with
  * @ref_sync_pins:	hold references to pins for Reference SYNC feature
@@ -62,6 +63,7 @@ struct dpll_pin {
 	struct module *module;
 	char module_name[MODULE_NAME_LEN];
 	struct fwnode_handle *fwnode;
+	struct list_head links;
 	struct xarray dpll_refs;
 	struct xarray parent_refs;
 	struct xarray ref_sync_pins;
@@ -71,6 +73,16 @@ struct dpll_pin {
 	struct rcu_head rcu;
 };
 
+/**
+ * struct dpll_pin_link - wire between a pin and another pin
+ * @list:		entry in the links list of the pin
+ * @peer:		firmware node of the pin at the other end
+ **/
+struct dpll_pin_link {
+	struct list_head list;
+	struct fwnode_handle *peer;
+};
+
 /**
  * struct dpll_pin_ref - structure for referencing either dpll or pins
  * @dpll:		pointer to a dpll
diff --git a/include/linux/dpll.h b/include/linux/dpll.h
index 7a6f8796cda2ad..e252d3c6b4334a 100644
--- a/include/linux/dpll.h
+++ b/include/linux/dpll.h
@@ -301,6 +301,8 @@ void dpll_pin_put(struct dpll_pin *pin, dpll_tracker *tracker);
 
 void dpll_pin_fwnode_set(struct dpll_pin *pin, struct fwnode_handle *fwnode);
 
+int dpll_pin_link_add(struct dpll_pin *pin, struct fwnode_handle *peer);
+
 int dpll_pin_on_pin_register(struct dpll_pin *parent, struct dpll_pin *pin,
 			     const struct dpll_pin_ops *ops, void *priv);
 
-- 
2.56.1

