Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794639395;
	b=O1PW0vuzKic9PMZ7cOIoKq+zaCMcSb+BN7qUzQiWvqRLlWsQoQ+MKJkHc29cE3lLy4a9
	 zOwryu/+Ej5AWg5F/lPc+ayOIeFVuZhUH2XV8qcn3UtYrI1M6FhqxhxNZi27quZn79bpI
	 5vP6NdC4TCWmKzvfJpi4hwkFBKBDtf/XYXxsqOxSzW1yOROTty3mxM4/+wO4Bud2m8x1e
	 EA+spesLBzAwv4Ba+wkXRkQKhztltI3n/8yw8oTBi9ccFC9wKBiqwyo9/pI2Ae1lGf28/
	 1SA0lMKBzUADs3LOocHuzR5nOvIvvAX41HDUU8UZbQCuvtY2onzh0WMU25tTvqBklsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794639395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QKl0/pXKKXGyvh42BinYHnSNdZD9xCVtj+nC7rTpJtw=;
	b=clA6gnJSRiC0kceMB3sX+4iho+YR+NQXCq72I94GmXKEm8w1BYmsVeJrPxA5JVSOs1ee
	 xgSWWL4shwg2WQ45Z9MmncIniDn9FGtVZzdmUEc8uKX1qFOr3H7DDnhuh/MSCOXpdor7+
	 iyGo6Ii1GicO3ySWog4drPzHWkSI7y2MxN3qIFsqe2kXw3umtV1gJd3pH/ah5HO3oLV34
	 osIwMHR05BByL9sWr0Ioma1cc1aQzIlFryboAmh9FbYiIv9mGMOOgJzrwIPryG0VniQ3G
	 nuRp3feVvDMbnVftR0ui99S44aSGXWYuNWgYMVUyBV1hjpaigLK/Ww7vGm34/LRf+Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieLQx75i;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF8F606A330
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 06:56:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FF8F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ieLQx75i
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-490a0e72588so718203f8f.3
        for <netdev@vger.kernel.org>; Fri, 13 Nov 2026 22:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794639393; x=1795244193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QKl0/pXKKXGyvh42BinYHnSNdZD9xCVtj+nC7rTpJtw=;
        b=ieLQx75iMYtQ5Zn6tj1ZZ0k25/zckwvZ6MrFdg0ZZdhKceKEfcY+2xyS9Xm9sC/yXk
         ar8l6GERrncewdIPZ49lT5TaFgUaaiuFOWxmjHwiYX3cbJXrROUGC+yVZm4CUsZUvUo9
         K1Uxekk0l4rejZmIWoo7d26QloSGgswAGSdaIWt/DUFsjtqKzxOZZnq+HnNzKVe1mZE+
         uNco0fO8LhJiCO52umsWesOItP7IfA1KpGvRlCaCRjbuB9MeHBWAp29t5mSmNEIeCEST
         AAWSinKEOat5f9/nRD3e0snOz5WT1afeGJ7Ysn+n8Nw2g5OzibYYuonTDeNRJQpdc28d
         3Izw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794639393; x=1795244193;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QKl0/pXKKXGyvh42BinYHnSNdZD9xCVtj+nC7rTpJtw=;
        b=R8xIvU5KkNP5Ai4+HRyeaqtRN31ID/+pmTZGiiIQ2YJ9/CsUne5pr+cfPKPUC67N1u
         a6O3MNTabtDhJfHWwC3ltdZ8kzQKm42lw50GfCSuLqJeJZ/4ZxtGCQ57yPyI6jvi3O3F
         NmNLWhs/SFqyf/5gUut38PZceT4bD0RmQ3yFBNEdfq/9mYW5Id00gVauM1QMjFuyQ69R
         MNEF07/mzUeWqTWVwH4bWVxL3VxfNc/6oqPnHhkVNKPwfPbTJKc8xgSJ2QJNYDPCyreb
         ULJnTnFwFp/v7k/vmYg1RhNfyFv9A3k1MDLyIY+vnxqzdIIhBjgXsHTriyOr1A0VOraT
         JJuQ==
X-Gm-Message-State: APuU4Z8eUWNZ1x0oy3xUfrBwPjWSVWPXjpdPsBC99+rI4YcfoQFCVlB5
	7GqxqkGXxE3CJvHJfNBlRLfVWUnhButvo6ES5UmpkSVvhKWKJ9aN8bJv+EsIog==
X-Gm-Gg: AYBFou02Vo+q/qgfZOG6Os57W9QihaSvJpZG0cvRueymwJmahV32N+Lzulp35xyo7Fo
	YOUwZVMP/FESOoLOuVLMJwJ8x7a4SlGHbJwzgR4eRI6+l508QHe9mvwdG1FCHdhYY1QV/tsOo6Q
	T3emUj96av2r3eqHTwWBAzJ4doHurJMF9NV6nMp5iqqzsWTJ6iGzjkVib39Oa+GVffK1DG1X3yv
	6sZsJUtUcSa8d4KLNNzt7HTK5XA8xWwxhsBlQmH5299mt9S8AZWidWNhvzW0sJ6JrkUjfHt9jMX
	84cCFGAyShspNRuFEJJmlENICytYWUzTAtolvQ+5rbKkipxlK8pHI5+wUemRkrze4gt6WFMJK0D
	gCgYHmWSo7aqraqVeUlx6NQKpiUYJSk5Mud4U6kFE5pRC0XNf2RmawHcKr0O0QiUMADuLxW+hsm
	+EcTJDGy4ed6cFSA+b8lu8q9F1+tu2IavhTUtbpYvKDwokDWjdB4bFCd+nvG1l0D/VCh6ddXV0h
	lWLS3usrYu0iSED7VFxVeeRW+FOktRB+kvdsY9YtT93gP84bXZheFuGwhEK6T3QWUHIu6DqNVKj
	WoA97j5XX3YhNW8bPKuwAS9gFd+7hM9Lph9y
X-Received: by 2002:a05:6000:4b02:b0:48e:84e8:88c3 with SMTP id ffacd0b85a97d-49c6dbffef2mr9563798f8f.5.1794639392693;
        Fri, 13 Nov 2026 22:56:32 -0800 (PST)
Received: from LAPTOP-AVI.lan ([2a06:c701:474b:1700:54bd:4677:5a7f:ed2e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm8801289f8f.29.2026.11.13.22.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:56:32 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: netdev@vger.kernel.org
Cc: akiyano@amazon.com,
	darinzon@amazon.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	atrwajee@amazon.com,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH net v2] net: ena: set admin device pointer before queue allocations
Date: Sat, 14 Nov 2026 08:56:19 +0200
Message-ID: <20261114065618.488248-2-thnkslprpt@gmail.com>
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

From: Wajeeh Atrash <atrwajee@amazon.com>

On the first probe, ena_com_admin_init() allocates the completion
contexts and admin SQ/CQ buffers before setting admin_queue->ena_dev.
Their allocation failure paths log through this pointer, which is
still NULL. A failed allocation therefore dereferences NULL instead
of returning -ENOMEM.

Set admin_queue->ena_dev before the first allocation so the helpers
can log errors and return -ENOMEM normally.

This issue has already been fixed in Amazon's standalone ENA driver
(commit 7d1dc4341d4f).

Fixes: da580ca8de2c ("net: ena: add device distinct log prefix to files")
Signed-off-by: Wajeeh Atrash <atrwajee@amazon.com>
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
v2:
  - target net instead of net-next
  - credit Wajeeh Atrash as the author and add his Signed-off-by
  - place the ena_dev assignment directly above q_dmadev

 drivers/net/ethernet/amazon/ena/ena_com.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amazon/ena/ena_com.c b/drivers/net/ethernet/amazon/ena/ena_com.c
index 297fb36ab8c16..9b14cddf4432e 100644
--- a/drivers/net/ethernet/amazon/ena/ena_com.c
+++ b/drivers/net/ethernet/amazon/ena/ena_com.c
@@ -1992,6 +1992,7 @@ int ena_com_admin_init(struct ena_com_dev *ena_dev,
 
 	admin_queue->q_depth = ENA_ADMIN_QUEUE_DEPTH;
 
+	admin_queue->ena_dev = ena_dev;
 	admin_queue->q_dmadev = ena_dev->dmadev;
 	admin_queue->polling = false;
 	admin_queue->curr_cmd_id = 0;
@@ -2045,7 +2046,6 @@ int ena_com_admin_init(struct ena_com_dev *ena_dev,
 	if (ret)
 		goto error;
 
-	admin_queue->ena_dev = ena_dev;
 	admin_queue->running_state = true;
 
 	return 0;

base-commit: 070411c1590c8172eb4d86f045d99c372f22fe23
-- 
2.43.0

