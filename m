Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438152;
	b=RQHdWOPVZ45fv2ILrUnbc1JmZ+Tpet4ImEe6kIYwEcwIh6vUyCRfHenmUNEpu5NFYaya
	 zU1KmJb07ccW1ggosip4O34ckcj00XiM3AabAJE8VIbOxMyPo2bVAovefuM5rOdGWnEhv
	 rAcnJAJhuq5VdjBDgmdhTEul5jLjD2IhxhYRjphSGvXLHbgc2kVo8DtuD9Zo4o7rCnxTd
	 wg0DhD+b3eyj/zqpKcGTHCfMT9DPYbdLQgdUFFAxQ+XpWq/YadGDQ3Y61Rz8icUPs9Ckg
	 oBK0NOiuvF1ypf2An50wJq6muc5Vo9o5/HnINOYx4d70EQ5kNB/CWy9PHC1PJHV6qoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tsppM5r9P8IDAZvF9tVeal/ifxUJ2bPVFRohpx39xuM=;
	b=OVIUSGsYB+XBXKrNouwriZDmKkvaDczo/7o+N6NBmX0hevq+BKJY7yhz1aC0ebUrSE34
	 pUkQwenqVm/ds5jg8zi2nfwkBvwL9ClsAwgcYtnjGMpXsh5VaPToWFKrtCODRZX65eAFq
	 mf7tLsyqSt9djq4w9w2fHyCTJeXSqVEV/Yv/FDlDlFiD005g7LM2YD0/4EC25AKX9keKt
	 fITUDja6Tw6YZHwDsEP6Rk4iMj7rO0MgylBWOj45UkmFI+EdyVFVGIgWEGGLz64g8mHqK
	 4UJ3MJ0SBXbloayCVw0jwRSTWII9sIa/HgwZrmCNp6p/Lwr9PMa46+mOMPzjbHwYGew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRSb+ieZ;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2D7606A31E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 12:49:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E2D7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HRSb+ieZ
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso29953165e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 04:49:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438150; x=1796042950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tsppM5r9P8IDAZvF9tVeal/ifxUJ2bPVFRohpx39xuM=;
        b=HRSb+ieZAHicV0bivaU64IiEiatkKaFIFWyiv7B6A4XjlUEfExYhH0hcBR0IxceoAu
         dAl25ourv9e15p4IFDqCmeHLcvynrdxA6AdKXBEB0IRvmv7uYg+GOQxho7BROmBQv9zU
         nMgmEaQ0j3XFIzs6nuYabWjj7SeZQmkXfR5BbvJUl7j+LZDuD5h6JanPMROLnKO17uOb
         iKY3EMiKz/StTFlGhrRLmOE992MpZDPzGHxi+MAzLJzStfYxmWqLlzyRmY4zrM0jNnvt
         C77BYMQPsoJqeWLHcfKVCW/mUyzmtZ3mQsBYmZ6nFD4z9mTf9RyMMKio/65eqI6Puft2
         QD4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438150; x=1796042950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tsppM5r9P8IDAZvF9tVeal/ifxUJ2bPVFRohpx39xuM=;
        b=Zqp1adCfd+z7P/XAGynPQaJEAj+vFTx+mzlBmpI0LaWlBQLrizBlg8LtaeKa1lYbGE
         2oXDRnKYCL3rBdrjt9+emxadl5UJFu9ZnL1c6iBp/KTUTZHsyBCEMZW45iunCHeJWYlw
         LN6NV1GW4oGl1xZZWjywOKXTMqjllImiiqB7EtjQ/xv5LRrmdZ2c4pByoiF7bZcFXcXr
         +aR1bGZ0x32HTF6zW0syEylcKR0M9H2Y4g3X5s7ABaGknmhYGYHvBzdGU3eArG4g2N/I
         w6DVbH5TCopVaiSnasi6qydSH3EbdSycPyohYV734jSNd8ba7kfb8uwc+mU+iRLs9Ks2
         +g5Q==
X-Gm-Message-State: APuU4Z/rZJuwTMWtXgpO9Z5gqhZc2QmW2DYhJnJlp5K3YD5Q3RLnpOxr
	bP320f7elL+tbZciPzTgzE1eEItXqKHMdGPQjkZzMK2kYkeC9cMkHVJz
X-Gm-Gg: AZFdTZc0WMRZa2rVSV1laPliF9ZwYuYcFTgZXnVQ6V9xqz4hOf6NgBRbUJiXzDMXBPy
	WIgKZGBboFnWuLgsD4LoyhV4zzZ18/7apqxFHvYKE8BJroPuglymbP9WpTLoSy17mHCzF+bn0pW
	00EimFQMkEWYMNYC7jq2KCeXLflcBOC4Jf/muhgCfVIyCn1RT3x4vgBckTm4JiAogQW4MVc2uOx
	bKPtzF85Uo2AJwu5oCiR9DqnVuYDC6F4rB39WyYqVX1gN3w91FgzSapZW6bhRCr3qiNt9VyYLYA
	Iqi6LmzVM92/YRzGyvsG9/iLMwG0nhobySaurCM/5RNRC0lMQMexsP/+DKkQYf/FWZDpYVARJDX
	NGpbRU6fmPwbNG1PxDX6eyRhd9yFBKvGWewZaS5PTaVoJdX0wFmAnKCANnle7Ri3ogQ9N8Otw+B
	V1TAsMkA6JTFvLl95ofU0fanQTNRcCCQ9iN37ji6OU7scvCpL1Ifvxq3OsBy5areve3JBMPwIQd
	aqMJckcko5i2+h9cH2Q5Jb27MmSF8JdMPQ2oz/5kE7c9tO98gaOZw+6iSzIM4GBbHJQOayxWtos
	PbRaMaZs+QM0a2/orab1jALX58dBOJyw3mG1iZs=
X-Received: by 2002:a05:600c:4f16:b0:4a2:47:b79c with SMTP id 5b1f17b1804b1-4bb8882a66emr266500605e9.32.1795438150370;
        Mon, 23 Nov 2026 04:49:10 -0800 (PST)
Received: from Philipp-PC ([91.227.186.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906817ccsm165097045e9.5.2026.11.23.04.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:49:10 -0800 (PST)
From: Philipp Sudakas <filzador@gmail.com>
To: ronak.doshi@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com
Cc: netdev@vger.kernel.org,
	bpf@vger.kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	u9012063@gmail.com,
	Philipp Sudakas <filzador@gmail.com>
Subject: [PATCH net v2 2/5] vmxnet3: keep the previous XDP program when attaching fails
Date: Mon, 23 Nov 2026 15:48:52 +0300
Message-ID: <20261123124855.1021-3-filzador@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261123124855.1021-1-filzador@gmail.com>
References: <20261123124855.1021-1-filzador@gmail.com>
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

vmxnet3_xdp_set() publishes the new program and drops its reference to
the old one before it recreates the rx queues and reactivates the
device. If vmxnet3_rq_create_all() or vmxnet3_activate_dev() then
fails, it returns an error without rolling back. dev_xdp_install()
treats the error as "nothing changed": it drops the reference it took
for the new program and keeps the old program recorded as attached.

The driver is then left with the new program, to which it holds no
reference, and without the reference to the old program, which the
core still considers attached. So far this was mostly hidden because
every error path of vmxnet3_activate_dev() goes through
vmxnet3_rq_cleanup_all(), which also clears xdp_bpf_prog.

Release the old program only after the device is active again, and on
failure restore it, together with the redirect target feature.

The problem was found and analysed, and this patch drafted, with the
help of an AI coding assistant. It was also reported by an automated
review of an earlier version of this series.

Fixes: 54f00cce1178 ("vmxnet3: Add XDP support.")
Signed-off-by: Philipp Sudakas <filzador@gmail.com>
---
 drivers/net/vmxnet3/vmxnet3_xdp.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/net/vmxnet3/vmxnet3_xdp.c b/drivers/net/vmxnet3/vmxnet3_xdp.c
index 5f47049..45259b2 100644
--- a/drivers/net/vmxnet3/vmxnet3_xdp.c
+++ b/drivers/net/vmxnet3/vmxnet3_xdp.c
@@ -66,11 +66,9 @@ vmxnet3_xdp_set(struct net_device *netdev, struct netdev_bpf *bpf,
 		vmxnet3_quiesce_dev(adapter);
 
 	vmxnet3_xdp_exchange_program(adapter, new_bpf_prog);
-	if (old_bpf_prog)
-		bpf_prog_put(old_bpf_prog);
 
 	if (!running || !need_update)
-		return 0;
+		goto out;
 
 	if (new_bpf_prog)
 		xdp_features_set_redirect_target(netdev, false);
@@ -84,17 +82,31 @@ vmxnet3_xdp_set(struct net_device *netdev, struct netdev_bpf *bpf,
 	if (err) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "failed to re-create rx queues for XDP.");
-		return -EOPNOTSUPP;
+		goto err_restore;
 	}
 	err = vmxnet3_activate_dev(adapter);
 	if (err) {
 		NL_SET_ERR_MSG_MOD(extack,
 				   "failed to activate device for XDP.");
-		return -EOPNOTSUPP;
+		goto err_restore;
 	}
 	clear_bit(VMXNET3_STATE_BIT_RESETTING, &adapter->state);
 
+out:
+	if (old_bpf_prog)
+		bpf_prog_put(old_bpf_prog);
 	return 0;
+
+err_restore:
+	/* On error the core drops its reference to the new program and
+	 * keeps the old one attached: the driver must keep the old one.
+	 */
+	vmxnet3_xdp_exchange_program(adapter, old_bpf_prog);
+	if (old_bpf_prog)
+		xdp_features_set_redirect_target(netdev, false);
+	else
+		xdp_features_clear_redirect_target(netdev);
+	return -EOPNOTSUPP;
 }
 
 /* This is the main xdp call used by kernel to set/unset eBPF program. */
-- 
2.47.3

