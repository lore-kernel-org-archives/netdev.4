Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795807243;
	b=FGJxT1H6qHuCS2A22VgBXDJ7NnPzDIQ78Z5YGjhhYr0ygdHxroC7X1CiapJ8awwAH+Y7
	 UrnMPFo2UCGjH07MlxUkyUrXLUPfWlTQo4MHL7/UZ8Xgfqkv1txejikMvS/FNPOdPN6mY
	 HyFsPpOA913R9pcINTTZ6IH+HkXfoTUz08x3cFpJfR0jfa40+kbhgsoDiXS8rtK0V942T
	 DSTT+gx03GQgxet5fcCjmjWtLcfEOLXa8523oUI5ULG6zzTSgUxhhtfHMnrhUdSGWfKft
	 R53PzbWaPQdo8+t/yCqB39TlBSgOWcagnIej0UwIgBPKLK8bJe539dWm3jQ7xrddqZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795807243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ueHmD94vldVBGFhH6UUzfvYsaqMftOxaFbH5GacN69o=;
	b=S6MlQ2Kdsv/HAXK31uvEbEp3Nyv2FqOB+xLI2XTUJii0E++/yS9ry9zWopj8XQDn0kDz
	 9Gmt5xglsMXkdohgIY16XvTHWdRkL1BWekBrbVaI/WUNPcFjwpEjRIhKcF6Mf4EsiGizm
	 x3nPVhQSKB6IiS2Ra0AZ0GMILipa9QxbXK/F4LfXU+1k3f8U3yzewGX3JGQgGUGGN6yOn
	 zqbedIDC1sIDL7sJYIQC7moxD5UqSOufuoVRjGhi8pdiVo2A9yHveNANLPWX+NzqdHTNI
	 u4L4KvdraxxTRTf4W/cIt+f9n63wB2w9sgIyRYQf2zVFO4CbXGer1Rw4Z51gVZI3h6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiqClvGQ;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AB61606A338
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 19:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AB61606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QiqClvGQ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so13030032eec.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 11:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795807242; x=1796412042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueHmD94vldVBGFhH6UUzfvYsaqMftOxaFbH5GacN69o=;
        b=QiqClvGQEsiDDW3NNcTysr/w4YOOLAmX5bNsL+i6YazuliCZhzKgwAOvLFTzPYiq5s
         Zy2/3K+LgHdUT/kdtjaF5B/ADtdpeF3uQlSDcC21VPKnpwcyjEnTUlYOIHdrGYzqiieZ
         TYg3JL5Kr5SMCAsRjRbeI8KoLh++nLKkV9O+E4IS8Cs9MMKlQR++7Fy6NmHIHXk4XrgQ
         QTBbEVH3sclOLAANU4YXAcj8gX3jn13M0FzxrKqUMSbk9YbF8kcGYpWyiHLbjzBvjq9U
         fxLBxT9p+6TVAe4CHkp9ynk4TaEVbxnrkkOo7Al9Zlg5kfA6lLi+eeoXI3fhEdCDABsh
         m/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795807242; x=1796412042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ueHmD94vldVBGFhH6UUzfvYsaqMftOxaFbH5GacN69o=;
        b=RVa4aGFPgKVbAacYa5igvD0Of77L9K7Zi0gLlgg6nt4K1gkDN7Nm+PLOyEQ/4adAiI
         I4N419JV2VZu9noK758KNXkjJU8P4JQXP63tfU12fLvobJ1LDZFs89hV2QNr5SwkUFtK
         ZFebU/J5L5iSvT84OX27PyjtTM23Lncv2eif051fLcD0zSNZvikGjAuueXYzRRBk7Z1t
         RC0ncxiHCmKKxGcoVAjV8brlVxa7Za8ZwYd1MAJi6mY5NyI2rW2q7AY485d6SpIHktsZ
         RqLj4UyqKQkwvgE/TPuyxeFsNMcIV9goa7FYzD59hOqb8hSJjQ50fV+7Gpql6r7lTuAU
         8frA==
X-Gm-Message-State: APuU4Z+jwUX3rQ/79qkcVpM+vGMG6fAZczcOS0I2L5JDZtQyRaEvl0al
	nmwRK8L2KlvgdlFl/sDW6MFBxt3Cqe9PWpArXj7Bm/akEQvK7zKWr1pjWIGP+tpZZmk=
X-Gm-Gg: AZFdTZcQ94ZFV4t4Rw+9DcZbnCrjx0N2gS//5CeAYXZqBNqeXcfiywXMuhEm85WvgAu
	JEH6qLHCUQVSn6MvkC9tIfr8pxPT+y3z7ZXZwATt24lmQcFIDhqaf42tv9N34Y8sj2XReWGU0ZT
	LeAuaQOWRh5E/xcrMpoWZnZvGcpuRuYx45RfCLdVhld/2jdSM+hz5sFcwM+QvtdxBnlepgE8FiE
	yawRxKJBrzHQF/++80xCjo1gUgmWhlM/lsG5kheCPEi9clJthJhflkckWDoeNORnfLUQ0fs7JGT
	YShvdI74UIn8cgdNSZDMlxGrFpx+alMErtVeF5bIb2UZtOutsuQwciqDtGDNwOn45rJX/O/uN5P
	W7iweqf1mZ04QfkydKQ0z4nYSJahKhcW83iqKZisw4UrjdkqKpg4oNB6lc75ZtB3as3eGHR7Lmm
	avKDcsGWGFqGTeaqPhVF+khmz77uvvb07GdQhI1aM7NE4ip6sxM6MVQvW2NBPzmoNSGu/Xattkl
	/Cj/V2QkvTeVYho8ItaVSIl1mtd23RprAvKkckULqbHZ3cG0YKxwiXdeVUIotisHQSNaXKlbcwE
	EmvGuKmYrvn515Y3f9esvWPKmpOW6KZwpYYmefJknW2ef0s/g1+M5/8g+bBYAskG/lA57tF1fW2
	BxipETQeZbq5nIbY9WrkPy+VB2m0L9c/SZF+CcLnKv7jMlKrqgN+kLdVC9QSPYQ==
X-Received: by 2002:a05:7301:1402:b0:375:ed63:5f12 with SMTP id 5a478bee46e88-3856fe564admr28432169eec.22.1795807241917;
        Fri, 27 Nov 2026 11:20:41 -0800 (PST)
Received: from Mac.net (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm74438668eec.23.2026.11.27.11.20.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 11:20:41 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v7 2/2] ptp: shut down enabled unassigned EXTTS channels on unregister
Date: Fri, 27 Nov 2026 11:20:37 -0800
Message-ID: <20261127-timecard-core-v7-2-ahmadexp@gmail.com>
In-Reply-To: <20261127-timecard-core-v7-0-ahmadexp@gmail.com>
References: <20261127-timecard-core-v7-0-ahmadexp@gmail.com>
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

EXTTS requests can enable a channel without an assigned pin. The
unregister path only disables assigned EXTTS pins, so an enabled
unassigned channel can remain armed when resources are released.

Track successful ioctl and sysfs enables under pincfg_mux. Clear the
bit on successful disable, including when changing a pin assignment.
On unregister keep the existing assigned-pin cleanup and send one
disable for each tracked channel, before disabling PPS. Do not send
requests to unassigned channels that were never enabled. This avoids
calling drivers that can change the pin mux on an EXTTS disable.

The calls still follow POSIX clock unregister and precede PPS source
release. This patch does not change any driver or any pin assignment.

Developed with coding-assistant support using the v5 and v6 review.

Fixes: a60fc3294a37 ("ptp: rework ptp_clock_unregister() to disable events")
Link: https://lore.kernel.org/r/179579937848.3135.14198689317939903929@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_chardev.c | 53 +++++++++++++++++++++++++++++++--------
 drivers/ptp/ptp_clock.c   | 11 ++++++++
 drivers/ptp/ptp_private.h |  7 +++++-
 drivers/ptp/ptp_sysfs.c   |  2 +-
 4 files changed, 61 insertions(+), 12 deletions(-)

diff --git a/drivers/ptp/ptp_chardev.c b/drivers/ptp/ptp_chardev.c
index f63b45f5ee6a..b2e198c65e7e 100644
--- a/drivers/ptp/ptp_chardev.c
+++ b/drivers/ptp/ptp_chardev.c
@@ -17,9 +17,28 @@
 
 #include "ptp_private.h"
 
-static int ptp_disable_pinfunc(struct ptp_clock_info *ops,
+int ptp_extts_enable(struct ptp_clock *ptp, struct ptp_clock_request *req,
+		     bool enable)
+{
+	struct ptp_clock_info *info = ptp->info;
+	unsigned int chan = req->extts.index;
+	int err;
+
+	lockdep_assert_held(&ptp->pincfg_mux);
+	if (info->n_ext_ts <= 0 || chan >= info->n_ext_ts)
+		return -EINVAL;
+
+	err = info->enable(info, req, enable);
+	if (!err)
+		__assign_bit(chan, ptp->extts_enabled, enable);
+
+	return err;
+}
+
+static int ptp_disable_pinfunc(struct ptp_clock *ptp,
 			       enum ptp_pin_function func, unsigned int chan)
 {
+	struct ptp_clock_info *ops = ptp->info;
 	struct ptp_clock_request rq;
 	int err = 0;
 
@@ -31,7 +50,7 @@ static int ptp_disable_pinfunc(struct ptp_clock_info *ops,
 	case PTP_PF_EXTTS:
 		rq.type = PTP_CLK_REQ_EXTTS;
 		rq.extts.index = chan;
-		err = ops->enable(ops, &rq, 0);
+		err = ptp_extts_enable(ptp, &rq, false);
 		break;
 	case PTP_PF_PEROUT:
 		rq.type = PTP_CLK_REQ_PEROUT;
@@ -50,14 +69,28 @@ static int ptp_disable_pinfunc(struct ptp_clock_info *ops,
 void ptp_disable_all_events(struct ptp_clock *ptp)
 {
 	struct ptp_clock_info *info = ptp->info;
+	struct ptp_clock_request req = { .type = PTP_CLK_REQ_EXTTS };
+	unsigned long chan;
 	unsigned int i;
 
 	mutex_lock(&ptp->pincfg_mux);
-	/* Disable any pins that may raise EXTTS events */
-	for (i = 0; i < info->n_pins; i++)
-		if (info->pin_config[i].func == PTP_PF_EXTTS)
-			ptp_disable_pinfunc(info, info->pin_config[i].func,
-					    info->pin_config[i].chan);
+	/* Retain existing cleanup for assigned pins not tracked below. */
+	for (i = 0; i < info->n_pins; i++) {
+		const struct ptp_pin_desc *pin = &info->pin_config[i];
+
+		if (pin->func == PTP_PF_EXTTS && info->n_ext_ts > 0 &&
+		    pin->chan < info->n_ext_ts &&
+		    !test_bit(pin->chan, ptp->extts_enabled))
+			ptp_disable_pinfunc(ptp, pin->func, pin->chan);
+	}
+
+	/* A successful EXTTS request need not have an assigned pin. */
+	if (info->n_ext_ts > 0) {
+		for_each_set_bit(chan, ptp->extts_enabled, info->n_ext_ts) {
+			req.extts.index = chan;
+			info->enable(info, &req, 0);
+		}
+	}
 
 	/* Disable the PPS event if the driver has PPS support */
 	if (info->pps) {
@@ -115,7 +148,7 @@ int ptp_set_pinfunc(struct ptp_clock *ptp, unsigned int pin,
 	 * channel.
 	 */
 	if (pin1) {
-		ptp_disable_pinfunc(info, func, chan);
+		ptp_disable_pinfunc(ptp, func, chan);
 		pin1->func = PTP_PF_NONE;
 		pin1->chan = 0;
 	}
@@ -123,7 +156,7 @@ int ptp_set_pinfunc(struct ptp_clock *ptp, unsigned int pin,
 	/* Disable whatever function was previously assigned to the requested
 	 * pin.
 	 */
-	ptp_disable_pinfunc(info, pin2->func, pin2->chan);
+	ptp_disable_pinfunc(ptp, pin2->func, pin2->chan);
 	pin2->func = func;
 	pin2->chan = chan;
 
@@ -241,7 +274,7 @@ static long ptp_extts_request(struct ptp_clock *ptp, unsigned int cmd, void __us
 		return -EOPNOTSUPP;
 
 	scoped_cond_guard(mutex_intr, return -ERESTARTSYS, &ptp->pincfg_mux)
-		return ops->enable(ops, &req, req.extts.flags & PTP_ENABLE_FEATURE ? 1 : 0);
+		return ptp_extts_enable(ptp, &req, req.extts.flags & PTP_ENABLE_FEATURE);
 }
 
 static long ptp_perout_request(struct ptp_clock *ptp, unsigned int cmd, void __user *arg)
diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 47ffc773065a..10f8dccdea4f 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -219,6 +219,7 @@ static void ptp_clock_release(struct device *dev)
 
 	ptp_cleanup_pin_groups(ptp);
 	kfree(ptp->vclock_index);
+	bitmap_free(ptp->extts_enabled);
 	mutex_destroy(&ptp->pincfg_mux);
 	mutex_destroy(&ptp->n_vclocks_mux);
 	/* Delete first entry */
@@ -346,6 +347,14 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 		goto no_memory;
 	}
 
+	if (info->n_ext_ts > 0) {
+		ptp->extts_enabled = bitmap_zalloc(info->n_ext_ts, GFP_KERNEL);
+		if (!ptp->extts_enabled) {
+			err = -ENOMEM;
+			goto no_extts_bitmap;
+		}
+	}
+
 	err = xa_alloc(&ptp_clocks_map, &index, ptp, xa_limit_31b,
 		       GFP_KERNEL);
 	if (err)
@@ -492,6 +501,8 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 no_memory_queue:
 	xa_erase(&ptp_clocks_map, index);
 no_slot:
+	bitmap_free(ptp->extts_enabled);
+no_extts_bitmap:
 	kfree(ptp);
 no_memory:
 	return ERR_PTR(err);
diff --git a/drivers/ptp/ptp_private.h b/drivers/ptp/ptp_private.h
index 99e7eb241336..0ad8b53405af 100644
--- a/drivers/ptp/ptp_private.h
+++ b/drivers/ptp/ptp_private.h
@@ -51,7 +51,8 @@ struct ptp_clock {
 	long dialed_frequency; /* remembers the frequency adjustment */
 	struct list_head tsevqs; /* timestamp fifo list */
 	spinlock_t tsevqs_lock; /* protects tsevqs from concurrent access */
-	struct mutex pincfg_mux; /* protect concurrent info->pin_config access */
+	struct mutex pincfg_mux; /* protects pin configuration and enable state */
+	unsigned long *extts_enabled;
 	wait_queue_head_t tsev_wq;
 	int defunct; /* tells readers to go away when clock is being removed */
 	struct device_attribute *pin_dev_attr;
@@ -148,6 +149,10 @@ extern const struct class ptp_class;
 
 void ptp_disable_all_events(struct ptp_clock *ptp);
 
+/* Caller must hold pincfg_mux. */
+int ptp_extts_enable(struct ptp_clock *ptp, struct ptp_clock_request *req,
+		     bool enable);
+
 /* caller must hold pincfg_mux */
 int ptp_set_pinfunc(struct ptp_clock *ptp, unsigned int pin,
 		    enum ptp_pin_function func, unsigned int chan);
diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index 90fdddc1e6a7..1583f8d75907 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -62,7 +62,7 @@ static ssize_t extts_enable_store(struct device *dev,
 
 	if (mutex_lock_interruptible(&ptp->pincfg_mux))
 		return -ERESTARTSYS;
-	err = ops->enable(ops, &req, enable ? 1 : 0);
+	err = ptp_extts_enable(ptp, &req, enable);
 	mutex_unlock(&ptp->pincfg_mux);
 	if (err)
 		goto out;
-- 
2.54.0 (Apple Git-157)

