Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010987;
	b=o5GLJ/ilnFImVB2CdWeLgMQNlEthuTaFGwEzPcxcS5zM3bjV5aGSUSe5vutM7+wcnPPE
	 lryMvSnVWbTG5bNVdOhgiw0XqkvGTOGEVRWALaOn4/NjYC1WaFiafGx331TplVWoMlD7M
	 6u+RtXh+aG3Qquwuni48cxbqFPi377S3n2ip281tRbU8rCEkCR7gFT/1WsxDRfh4BwFX9
	 t+UADYnOrWhq2gNMQz4q9doKF5ocPU/UCVwXy4bW3Omp3ze24Rgfd/q312wDGa418ESl9
	 GaX2iNaido1Ttar9JprZyEDLKjYAHkbjKkq1Y6ElR4CyRPwUsza0S0XPUbVSWVcV5oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010987;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=tcgPJyrG/tkBCFtIrUZsvk3sWZQyrMsvPzB+MTHh/GA=;
	b=THl5i0DD0aecdl2B54Q683AjzItillkpofygNH7FKVocUCBH1ty/KMD0BshrQNNvx5BH
	 sIooF8cXsHTxgeeG1gLd1bu8L1BSid/0KJvzxl+QHPC1eije1wj50jNku9yKOzpPNxNgd
	 o6or0WsSzP1jd8p2K0yiBxO+ynQytHv4qOzTz628Fw4o4foQASl7dgqfFNREClui4wT6N
	 mRNs2KZgOg9Wrk6MGbQT7c3OGSU+PYwk0YdhJqnoXy8GGDBZ84kbs0JG34acAHDYLYHGZ
	 Fe9EVf94iCY0KJKYtsVLuYxTh51QuZwxCjIkA/d7xxupR7VgPw5DOT50TYG0l7ebsUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAnecXSD;
	arc=none smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C360A3807
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 14:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C73C360A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LAnecXSD
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-702fd86d674so683314eaf.2
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 06:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795010985; x=1795615785; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcgPJyrG/tkBCFtIrUZsvk3sWZQyrMsvPzB+MTHh/GA=;
        b=LAnecXSDfxZKBC7lRKXezKA7kvBi80WIMW4p7syBsLb2sx99DS24F+9izV7rEHKh4S
         uUDaCJTRi/Blg/8pyTYCFCnPvM6viGAohCKP/iLaIN4+hvlWWxJIFKrcrHJ0DGj1VCEJ
         97hSq8VH09GnRuruyRZAKJHcn6hzf4r2gnfxEZIvU++MHl4EHk0pbdVQ6VpHv+wNV7B9
         cgZijaS4+K2FrnG3Z93Pw7fQnwMKQFsmo8yqd4h0zgW6sAk9kN0WWH1C9ERMbjlbvjAy
         u+adpm7CzPFKDzBomD4Jr8f8lGd+A5d3qtKpO29CPK+x+R6AL7R6f4HEaidVejdM7Kpi
         GzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010985; x=1795615785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tcgPJyrG/tkBCFtIrUZsvk3sWZQyrMsvPzB+MTHh/GA=;
        b=qtJdHWL2PHood/t/jDLmFzw0St7Tl7CjpUyY2/okMtXvY/K8DygFB3N21ZXaZwht+O
         eCO1gUSRxkNyGI9/+qhekYW/NA74Hg4foILFEWJWOYuhN4coqDNiKGD+aD6GMs6X3cfx
         ge8xvjhrH9QNxjkqPhbSS7Unp+RU1868pLyZB+IUEBvi4i1j9MRQOAwdd7XwpPqVA3R2
         u0IgCemGDcQcutCiL1Eefp9uBfuUj/LeFrb11tkaEkQzz3u9SMOZsB27qHDWAw/XqCok
         3ylbdOg2gFiIsfuqs73ifO6Cibihr8EhU6zuo6TrNVm/owD0xZlA5Z0ykmIT4u8asmmt
         7PHw==
X-Forwarded-Encrypted: i=1; AL+hErErDGpbRg54J7vvuh6Jvetn5EAixRXWh8EOfuW/J8YSTJr4tjkh2yaxigev8s7LDbaQI9KsHIY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8D0cHI5pJWB+9EGrGDaxeF/9HqizEIU6a0k1DJxUlMVHpGvYJk
	mtj6pn1FemEqxDjIV4tAPAEMy7sDKCOQeWrggLTE0eBrVgbqZ54M2x5m
X-Gm-Gg: AYBFou3N2fSeEXmxtc0ioO/UDY6MhEIZeuFl64VAcOtXM5PVXqMSLx3ul3bwFXHu7Oa
	PzS4w0rVA4WBAzMsRkRznN3We0otXP2HFIZI7b7ABnRLT7TvZkWzYwJL/gHcXCsT1HY98gYqZlu
	zcsjVo/FfqQ8ICxsnboyrOI0gFERs02wan4EAK2l8V8nCgfG8BBDYdFdftPD6FtC2k9dl55K1zk
	168dtjLw+R7MICA+oQTJnyAcNVTtcmFszP+hpUahnAO4rVcZRTXFauZ2MCVAzAO+bcqJ96r+jqy
	Ddu5dR8v2HFqjb5UfdfRF69jwsrrcMLjoe7pZCqMgpnlPfPLjyhgoVAQXnj82bWMhmIyaUjgQo8
	UBA7bHd721D3qL3PNarfh4SeuZvlHNjegJFObdlUykHS0tK8/vBm6dNnbC2eR0x9Gm8LQOQjoMc
	e7Ub1vjJ+tIBlTjZjqY0Z20lBKWhhfyj4mfUbuOJujRZKDdooSCXLDP51zZprb3YZzfIkui1YEo
	iNBoCB4RMAsLNGhS7sGbYG7/w8KbbciweCbkH/FustQ5ihd/otGNAJ0o4QgzBladiPKhKuwZpOg
	u1wSLVcFPRs+dYpfz7amK6MnrsA=
X-Received: by 2002:a05:6820:1355:b0:71a:ee31:7b87 with SMTP id 006d021491bc7-71b18460540mr1709015eaf.32.1795010984713;
        Wed, 18 Nov 2026 06:09:44 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:42::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b19516ea1sm1983557eaf.11.2026.11.18.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 06:09:44 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Wed, 18 Nov 2026 06:08:05 -0800
Subject: [PATCH net-next v5 3/6] psp: document lock ordering with the
 netdev instance lock
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
Message-Id: <20261118-psp-v5-3-b9ec840e0296@gmail.com>
References: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
In-Reply-To: <20261118-psp-v5-0-b9ec840e0296@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Donald Hunter <donald.hunter@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org
X-Mailer: b4 0.13.0

PSP core calls driver ops with psp_dev::lock held, and drivers may take
the netdev instance lock inside them. mlx5e_psp_set_config() has done so
since commit 1e6e0cec0dab ("net/mlx5e: psp: Make PSP steering config
dynamic"). That commit established a lock ordering that was not
documented anywhere.

Document it. psp_dev_create() and psp_dev_unregister() take
psp_devs_lock and psp_dev::lock, so assert that they are not called
with the netdev instance lock held. The next patch adds a work item to
PSP core which relies on this ordering.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v5:
- new patch
---
 net/psp/psp_main.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/psp/psp_main.c b/net/psp/psp_main.c
index 273b010d2355..ba44154cf8dc 100644
--- a/net/psp/psp_main.c
+++ b/net/psp/psp_main.c
@@ -19,6 +19,8 @@ struct mutex psp_devs_lock;
  *
  * psp_devs_lock protects the psp_devs xarray.
  * Ordering is take the psp_devs_lock and then the instance lock.
+ * The PSP instance lock must be taken before its main netdev's instance
+ * lock.
  * Each instance is protected by RCU, and has a refcount.
  * When driver unregisters the instance gets flushed, but struct sticks around.
  */
@@ -53,6 +55,7 @@ int psp_dev_check_access(struct psp_dev *psd, struct net *net, bool admin)
  * @psd_caps:	device capabilities
  * @priv_ptr:	back-pointer to driver private data
  *
+ * Context: Must not be called with the netdev instance lock held.
  * Return: pointer to allocated PSP device, or ERR_PTR.
  */
 struct psp_dev *
@@ -64,6 +67,8 @@ psp_dev_create(struct net_device *netdev,
 	static u32 last_id;
 	int err;
 
+	lockdep_assert_not_held(&netdev->lock);
+
 	if (WARN_ON(!psd_caps->versions ||
 		    !psd_ops->set_config ||
 		    !psd_ops->key_rotate ||
@@ -127,12 +132,16 @@ void psp_dev_free(struct psp_dev *psd)
 /**
  * psp_dev_unregister() - unregister PSP device
  * @psd:	PSP device structure
+ *
+ * Context: Must not be called with the netdev instance lock held.
  */
 void psp_dev_unregister(struct psp_dev *psd)
 {
 	struct psp_assoc_dev *entry, *entry_tmp;
 	struct psp_assoc *pas, *next;
 
+	lockdep_assert_not_held(&psd->main_netdev->lock);
+
 	mutex_lock(&psp_devs_lock);
 	mutex_lock(&psd->lock);
 

-- 
2.52.1

