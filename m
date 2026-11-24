Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495368;
	b=IpdIgbMucva3K2f6AtC2aJKsgOxd/DLVvL4UCBxUgKW+vqZ3/PVRSRCaWI8IGm13hLn7
	 QliIrkJa5IEXMYgLobvlUbaaJFpUgX/RiTZjza8YQmBpac8ZYMtDOjwdN+RX0IppTg/I4
	 acbiEe2KyVEu0mRirrcwuv/yepoIpl2Iiyz/+wLGnIl9VOeKB31XscJ94WdASzE4e7IiP
	 CPFf4hmwfvJwRatoQCRiS7YeQ4CMtmKWRDK9gYaEy2lqytN0xNDIeGYi1/s5JyLOu2ja/
	 BdLP3J0Ql/zvMgy/yMC8C/dD8K6+NBltXSckdgliNsfmhescvdt7R7SR+z6wR6YVQwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h8MKC8Lxgq/9MW67tGoN5njDnP7Mi9uawf/28NfiV+Q=;
	b=YaUgj0OJ5g5+M68vNwGDt3292gIVjVi3fdzcJfu68bY2hMd/qT8Fyg0rCzfHDYMVAUEC
	 Jeu98tyGNqNDi8nhFAD18HZbBrYmYlpAhE5QOk7IhSU8RH1xOLGH6Ymhw1BRNJBNc21d7
	 qocIKym/5hM6rQ5w8hkSMsHYG3o+L65NUS4H5adheJqJZ8PYVhaPCqllih0a25DTqGRmH
	 60oA2SdGRAKzmMDG6kxs6E323rXHmoi2c9uzGt0gVElTX1+mvGHzHEMc9+OIYk3J1NUR0
	 DgUk5KuDEg1GExkxitErdmBWyvLWj8q3gmzNF7X1MOjPuGSuGJCpS0DAVHGmLQUMPAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kypXJeUH;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF3360A260B
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 04:42:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF3360A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kypXJeUH
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2761c69fbso3562669c88.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 20:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795495367; x=1796100167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h8MKC8Lxgq/9MW67tGoN5njDnP7Mi9uawf/28NfiV+Q=;
        b=kypXJeUH1IswXcwnOpxZ5nFz/QhCTLna/YbDFxvbtQa6TMQFBuYd+WllGHDHEvOWi8
         ddK7p6tc67DsR5MSOvfFaHMYguRs7gfHp0zTGkCgGE+cepWrYHRMj9jPKdH9aOoUUkjo
         fxDJHTnglOroCLgM4u5F8zguOZGqjxg7h2FBaUJ97CQQL0s7oqZ6bMl4hkHcd2lEZH4/
         x8q+SGQnqk8+oAJ2ZA7hcEFJ/jpewlYqaLOsOVGaWOI9Lt7mHz49ONjDVUvQF7rOjXU6
         VhC+VGSWsNnAqy/vcA3+tT0r4s1m1beYp3WufCJp64VKbENaoVqHp42WggC4gDmR4P3s
         6M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795495367; x=1796100167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h8MKC8Lxgq/9MW67tGoN5njDnP7Mi9uawf/28NfiV+Q=;
        b=fK9bmNyU7BoRU8w9EuzfrcIFarIOHfRo4DwuGGCGf1SCuo35lrLtUqfdjr8HhKNOvH
         1di3fK+Qn87FgvzN0tNpbN954i3iGaICFTDbrFaTGrIerKc8CQ7RS90uc9Gx4apC7aBe
         NXDmqepdg2mpM6DuIcIRmyz+aQA7pDABjHJ6RUoqOfZ8La/iiQPYzc+5iSCiEWdssLLP
         +5N+a1ornu5udsUtKE4nmEMRHaX2H0jJ6ruL39T43y5GPuEqJBu+gaXMbEDltF7pAmpe
         ACt+CZdKChQjmCXATbYzM+BAIM79ZyEDpKxf3QNj9y2B5d+TVL1xbrWpu7ojBh259IP1
         SIAQ==
X-Gm-Message-State: APuU4Z8ZQ04yGLx0Ot6psggNAgdx8F1mDCI2QiK9zgQuRQvJ1Jgejw+7
	NlWjHqQwPjDuV3MMLcfTkCtJQ95JlP0cp7EVvlFvXCktDQbaJZWlyCuQhZ1oNAA2
X-Gm-Gg: AZFdTZf5kyk8Hd4nRjWDzDXDlEZysER/fkHNTrORnatYEumtlFyA1mnuMbLmhe9RO/T
	xuqL9eWampi2phc7boZCIELrrNi1G/XCWjEd3msN2DgS+sXFCppP23dDWtZWSqZzlOQvcUufXkX
	2D1uSAfFV9/oIv0hiaAASkyhrbJIK50gTiGd/AQrJ53XvUGsq//feKdYCuKJ1ssbKWs7A/wZnuS
	mkHmCz+8QHxcdXXOOC4W2bg9YVf7yjgnaxnp2H8G74dser06hvP7bY0L9/MeWmS9w0gzJc0Zu4C
	jmbf7WVgNMLG1MI9DsXjz7Hm+YKIXVHJ042OY0eB5Ff4nBrdxqLSwODh8TpxZhj9vgHw+Kjt0I+
	VtX0WAEBUF9vxaszM5PP6IZA8Q05Zdyhh4S3EHs4z6YTfBVFSxKDE6d/LcJPV0QMbM8AxXlBxFo
	pk4lcBuU4E2egAEQspFqUE4DIDfx13ZNE72o4rhCGYjTiOfN0tZg6BiGQ0aTy9isxedytysjo4Q
	drgFhDWgNZlnLpYKIuSDnt5x/UMyexDBFgzfkWdixbbbw/MocTbHyvxLvuLkYkx26mn2XOSE9qm
	qiVhA9OJieYg05O8niEhdpNy9iR7nPKM84eYVF52n1xO/DtqrWrg+lSVzxpoaPK2HNe5qEAWvO+
	lFhvwETUVlgFY9tHNlwTFnV4p8qrK3jdHRi+FGFAlS2nTk+BzDkfIS4ub4+gZ/kMWsOwO86Ec
X-Received: by 2002:a05:7022:285:20b0:1b5:75d1:3c98 with SMTP id a92af1059eb24-1b575d13eeemr4181161c88.8.1795495367344;
        Mon, 23 Nov 2026 20:42:47 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55682d301sm32217346c88.10.2026.11.23.20.42.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 20:42:46 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	arnd@arndb.de,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	john.stultz@linaro.org,
	jonathan.lemon@gmail.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	olteanv@gmail.com,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev
Subject: [PATCH net v5 5/8] ptp: ocp: recover disabled SMA inputs when binding the driver
Date: Mon, 23 Nov 2026 20:42:45 -0800
Message-ID: <20261123-timecard-common-v5-d669cfa034-5-ahmadexp@gmail.com>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
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

Disabling an SMA input clears its mux field and sets the software-only
disabled flag. After unbind and rebind, the hardware retains the cleared
field but the newly allocated driver state loses the flag. Direction
initialization can then report an output function for a connector with
neither buffer enabled. This happens independently of DPLL support.

Recover the disabled state from the mux enable bits when initializing
direction-configurable FB-style connectors, including ADVA and ADVA X1.
The existing direction selection picks an enabled side if either side
is enabled. If the selected side is also disabled, neither buffer is
enabled: represent this as an input with the None function. The mux does
not preserve a direction for that disconnected state.

Do not write the mux or change fixed-direction firmware's interpretation,
since it does not provide these enable bits. Keep this initialization
fix separate from the DPLL frequency-reporting correction so it can be
backported to kernels predating DPLL support.

Source-derived tests reproduce the lost state with retained mux values
and fresh driver state. The corrected initialization passes 243 modeled
FB/ADVA/X1 rebind states with stubbed MMIO under ASan/UBSan, without mux
writes. No physical rebind was performed.

The issue and missing earlier Fixes tag were reported by Sashiko review.
Codex assisted with the tests, correction and changelog.

Fixes: b2c4f0ac53f3 ("ptp: ocp: Add ability to disable input selectors.")
Link: https://lore.kernel.org/r/179538006912.3135.16971430532149423594@kernel.org
Link: https://lore.kernel.org/r/179548551472.3135.11972018356692852897@kernel.org
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v5:
 - Split initialization from v4 patch 3's DPLL frequency substitution.
 - Use b2c4f0ac53f3 as the earlier Fixes tag for the lost rebind state.
 - Describe the DPLL-independent behavior and backport scope.

Testing: this patch alone applies to the net base and passes 243 modeled
initialization states, without DPLL calls or mux writes. The unmodified
base reproduces the lost state. Older trees may need context adjustments.

 drivers/ptp/ptp_ocp.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index df1a428eb2fe..c4c9d3501edf 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2932,6 +2932,14 @@ ptp_ocp_sma_fb_init(struct ptp_ocp *bp)
 		reg = ioread32(&bp->sma_map1->gpio2);
 		bp->sma[2].mode = reg & BIT(15) ? SMA_MODE_OUT : SMA_MODE_IN;
 		bp->sma[3].mode = reg & BIT(31) ? SMA_MODE_OUT : SMA_MODE_IN;
+
+		for (i = 0; i < OCP_SMA_NUM; i++) {
+			reg = ptp_ocp_sma_fb_get(bp, i + 1);
+			bp->sma[i].disabled = !(reg & SMA_ENABLE);
+			/* Both buffers disabled: report None. */
+			if (bp->sma[i].disabled)
+				bp->sma[i].mode = SMA_MODE_IN;
+		}
 	}
 }
 
