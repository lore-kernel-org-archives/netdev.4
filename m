Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795349366;
	b=dVg5AVB8LKik15rUt0ZbjydpJKPpBOe8whvFa+5VCE6sFNNVo8SM7r6g79l+JsYaNgtr
	 eM/p+DZtFc0NUfac7sZF1H7OfYqRGs5FZix0oR0wNhp45ipDOiybqZtzgvBg7Fjr1JBfH
	 V4SlbUcHLldOEtEXTg+e7B2SGqbvfBc0j1SeI8GL4+lfDYSFGIsU0KZNg8B53OY/DUTpu
	 6Hbq+GBrMvkPqFNl95VJ5Oxs5ESX8AvYuyM8xYPr3rZJj8czcz6BsZs7kZJtoKLJIxdUF
	 vHHcZ1AIuIbvpjSf6npB9bPLaxSPz2Chv3XfBI5reRLX/1DskB+ptmSipryYfFFs3mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795349366;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Vo8KO2KJ+xe5NqcgWpWn5sRi3V4otNrp6pD7wdiaeIg=;
	b=IxrAYkW0RikcBZb0aubv2Z+tE02iaZYMaVFFiyhdxus+lacZMWWh3OE08G8/dwAAPiJk
	 9Xlh50tN2RhKjx4jVH5Ez/mIcGT67bpLQ9g74NtkcxRYIpupMAd9CBRQ78U9AE3NB2+8H
	 +6j1IL9TvTax9x8rflHZygJfHSdoKYO57RDrSwIo5XjfAyAgrbIMJy6jGE96yCkgY27e0
	 hUn/gqwr5pk5r6pkXnXwT+DOyuCbE58/EqxuBxf87Y7Q0HnAERm5heotiIn4X2Jp9Fx06
	 uUMIirPEabYrbjc8YLbQ2FdB0V29t4mBQafKlWXuPBvfjAmcRsxnTuT7Axf1tou0C/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Iv2edekw;
	arc=none smtp.remote-ip=74.125.224.44
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFE606A32C
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 12:09:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CFE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=Iv2edekw
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-67db8985419so3040017d50.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 04:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795349364; x=1795954164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vo8KO2KJ+xe5NqcgWpWn5sRi3V4otNrp6pD7wdiaeIg=;
        b=Iv2edekwCcVIQp9JIMsfLhk6KtoiV0WhRuD1FoDIRhUZsxLA2kgzsksYDDlnY5NdLj
         QTmbmISW8g0su/g5+BFFz+65uDTd6p7xZ4n5+iHa21Cf9mBL/0iwxOGqjUi2dR2vr9+O
         UyN8+2lSQ4KEgbwZTJIMOzO7HpzYQW1qneGMuVKZHYveD1XscsYYGBp1JauYkNyuMvpb
         DQ7lS29jTR8iypzv1awMBPRFuN0pyyKlUiDxvXF8n04RhcYHVGPSRlpXAdX1TW/U8O78
         8HbEkFnVxM2h4kREUrWn+N5bIMsV6ge5D3B59Kkdro3yg6DDF/VJptuL1Q4Aj+GXRvTl
         WGNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795349364; x=1795954164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vo8KO2KJ+xe5NqcgWpWn5sRi3V4otNrp6pD7wdiaeIg=;
        b=qWBj4hkZiRhQ1eIHbCgrLkvXGF50fgbQ417LxjkSH1NJo7YcXTFSyuoNFKrLgOg0Dx
         /sisjMUYT8P3gIrOUh1zPZ0BONLpPYKTzRCLtCSTTzfLRTz+yLpe2fy/dfvgAKsKnqfZ
         LhKb4d9IRHuLC32aoUP/IKyIYFu3S0KepYebLFKRBNyIE3pH+DoxG4Ydokuut0qZJW7q
         W3YIc+oc/dJ0e3WkjksUJoEsdNusfH1tP8fxbS2kLfDWr5t94wibDg/1ZOgZen5S86Sc
         wCSPV28XtVdj8Htl9KJiGELVI6/dND3UlHTKYdHYBAgH6fhrM1tROjG6knd+6GjfT1Iu
         2dvw==
X-Forwarded-Encrypted: i=1; AL+hErFn2v133yDlbaDJaQ0OLSCt3Mf1U2byFjVVuxPkGn7cwO69QsCzjSfaT1S5AKdSb76XzdJ3jt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/F6egQYjkVmi2XAsLP5bQGIW5y+JQHoNFsqP1ZyOwesIAIt5p+
	cos4Yb/UMUJf+kgBZGSFPS7QDZoEXv6kkCVeb9usUv0bKoKz4rQnyS4Ib3RjK5DpVg==
X-Gm-Gg: AZFdTZfImsHec70mlmDGnHfUrkXRhIqhGj0hyqRNBmErBB3BqIwydblJrkPksPT8+YP
	GxpvhiF+onxBJ6KjR3ECHHKuhnuRJFH1iMSLQuXj7m9Fv700wUi88Sp+6UiHN8fiXc8C9vKusrk
	YSdCivzXd+vEEKsv+eAEU1/DSoT5EjJFbnt93s/HOsTJDrBaWLe/glkQhtyQDDhPUNekRCH8qSV
	pUhHtzMdrckVchlA0YNZcMD/KscEg9+BTQaPPemujNG5uYw9DGRz5abT83r0pDtgTdec+5RMTfm
	lfE5UPibjO2Cn/PFGEUYraJpj3jrvxPdbz7Ve7xnOx89DzDxcKAxkkVKJUG8bJZ0U+kS0Wxph3x
	HqJyRIuhB0AphCYs/XWSoDYOAQIIY4BV+jZw05TmnaalqEg2WNNo09T293eyaNmw75ovyPFoe5S
	b4qpmSUyPkQnHFr7IdZmOSThOMOKkObNwwU2lHWPRRGj5wsXGNFT4hQiSEKQnkqJuD9iGOkaT+G
	eUMUFFnfDEQvOUp41bF/krN6wHagYQbXdarqscnlen8VaD5g6AfWvZFjseB0VW6MCYbPLCjo99p
	njOM2hhYRfVEIXhuSi/vp09rPL7FSLdO2Jxa20N6eQCaJQJFyQL3
X-Received: by 2002:a05:690c:6088:b0:8b4:d26a:aa7d with SMTP id 00721157ae682-8b5204ff21bmr37330077b3.56.1795349364614;
        Sun, 22 Nov 2026 04:09:24 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201ba5absm34801557b3.4.2026.11.22.04.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 04:09:24 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Jason Wang <jasowangio@gmail.com>,
	=?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
	Paolo Abeni <pabeni@redhat.com>,
	kvm@vger.kernel.org,
	virtualization@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] vhost/net: bound the count of VHOST_SET_FEATURES_ARRAY
Date: Sun, 22 Nov 2026 07:09:19 -0500
Message-ID: <20261122120919.1718445-1-hengyul@cs.unc.edu>
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

Commit 333c515d1896 ("vhost-net: allow configuring extended features")
added VHOST_SET_FEATURES_ARRAY. The ioctl reads the number of feature
words from user space and checks that every word above the supported
ones is zero, one word at a time in a loop.

However, the loop has no upper bound and no scheduling point. As of now,
a caller can pass a count of U64_MAX and a pointer into a large
zero-filled mapping. The ioctl then stays in the kernel for as long as
the mapping is readable, and a fatal signal is not handled until it
ends. On a v6.18 debug kernel booted with preempt=none, two such calls
from a non-root user, each on a 4 GiB mapping, froze a 2-CPU VM for
56 s with soft lockup reports.

Interfaces that take an extensible structure from user space limit it
to one page (openat2, clone3, sched_setattr).

On a KASAN kernel with a 1 GiB mapping: before commit 333c515d1896
("vhost-net: allow configuring extended features"), the ioctl does not
exist and the call fails with EPERM at once. After that commit, it
fails with EFAULT after 26.0 s. With this patch, it fails with E2BIG at
once. A reproducer is available on request.

This patch will reject counts above one page of words (512 on a 4 KiB
page, or 32768 feature bits; 128 are defined today) before the walk
starts.

Fixes: 333c515d1896 ("vhost-net: allow configuring extended features")
Cc: stable@vger.kernel.org # v6.17+
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
I found this while comparing the behavior of different kernel versions.
I used an LLM to analyze the problem and to draft the patch and this
message, and I analyzed the result myself.

Tested on the vhost tree at 44293796526f with KASAN and lockdep: counts
of 0, 2, 3 and 512 words still succeed, a nonzero word above the
supported ones still gives EOPNOTSUPP, and VHOST_GET_FEATURES_ARRAY is
unchanged.
 drivers/vhost/net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/vhost/net.c b/drivers/vhost/net.c
index 631855064b3d..22e06b44d2ed 100644
--- a/drivers/vhost/net.c
+++ b/drivers/vhost/net.c
@@ -1795,6 +1795,8 @@ static long vhost_net_ioctl(struct file *f, unsigned int ioctl,
 	case VHOST_SET_FEATURES_ARRAY:
 		if (copy_from_user(&count, featurep, sizeof(count)))
 			return -EFAULT;
+		if (count > PAGE_SIZE / sizeof(u64))
+			return -E2BIG;
 
 		virtio_features_zero(all_features);
 		argp += sizeof(u64);

base-commit: 44293796526f4343639f87b2acc53811c78b5d54
-- 
2.53.0

