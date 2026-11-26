Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711340;
	b=V5DbcWBbVUwLgacv64wV70ThtmBWNIv0RGMW9g28GEPTfJmI7+MzD0Nep8a9k6PBU+ht
	 +ynzjDeXqMhL+Anhn3KbT1IvInvlI4GNY8jh2nNazzG6vBE09YMnilKKYIQ5YSoHAU/l1
	 OS3zcLqYifULntaKHc/VSCJ9YHULqv6raxtJr8wNIrwF1S1C4JmmtUpcsF3rfn2nq004p
	 IUvCzly8SUrocpaqx75I3AC8vKvz0sPyBi2xFrLDUg7dgToSgH/DSB3xUa1ov2/aBalLR
	 PTUP+P5JBcWcxr5YpQ62HATbvDUbvM0LhStwlYsalujQbfN+BviFS6wnB1+3kWGn33A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711340;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ieM/Xh62gUthQximT6l4fZxjNe4iv44Bu/bWfCxIhh0=;
	b=Q2P8W9WjVuQ9nc4PTuQjUTQtAIFABuWBlJjmD+1UcZjSE8VJ8V95r0YgqSa/6Ae0GRhG
	 Be3k7l5M1cV4bFXBEM+IPLOG6CVXZOqCHnBRrA0YFwGb4CjRWVPxmx5cJxEqxDLoYJ7K9
	 HRgqO3dsDN6Urf+aTbWPxoMLrLP/BR4nhW+7nSq/nShDxjmo1xH9iITpEB5zVSorf9eeS
	 c9ScMi/GEFVvMnDljrzhBT5PVWw9dGledDOg1qxbuuo293i7vGnsAJXcry6XaE1tBtcIU
	 wGN8FuGK8hPacDNW1UBe5VSP416L3lYhvfSBRKrbKPEt5MoDucGQcpJX/F2t0K5EHMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykVmHvYl;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844FD60A3808
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 16:42:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 844FD60A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykVmHvYl
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38692f62b22so9258070eec.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 08:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795711340; x=1796316140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieM/Xh62gUthQximT6l4fZxjNe4iv44Bu/bWfCxIhh0=;
        b=ykVmHvYlbr0DkP4R5glQ6QXXEtpXluiYENvL+TXKW9Zat7vmOqhmVnjgknIfFAm0nV
         Ey6BlrnuvwDlCtaOHfvC2MU1tj36goSkqEEedS2PfYUwyRAvf10/0x78iGsLlY7OGnmV
         sk8jznQ0XnKBzvnAV4uLAqRf4kiuhDpccRxAJ1rhCKgSmBDb8GtJ8CWmEA3oUIy8re57
         zuCEVQ4W4P2yIjaHQxa293DOVB9A7elBolSMw8FxBpx/BWLsdNkEmN41Ps4S+ipkP37z
         jiXW3yRfWO47Qx6zH4NI+gi+wm3FewaV4mSmhptjXq+WjZWER5duGETTXSPGs++TkMFe
         K0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795711340; x=1796316140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ieM/Xh62gUthQximT6l4fZxjNe4iv44Bu/bWfCxIhh0=;
        b=OOVCiyfUI/uaqQKVyAfgVRw/T3G/hakih31NWCgGdsuhnoEwXQKnffHQAdz2AbQj22
         U+hdiDPEuuYg9foobuVvmNAEHEUtChkd8fE80/6OE152rJXMpTkSXL0UAgWHyK8yahjx
         gNqvIW5S11d0sjp3qUaNDjL6f8+Td0IvtYAbJycwP0TV013boh5sJdRJmROsh59oRwCG
         Zq56neT+fcUgn1JRj5cXGpVJXH0xacpp54SntZwiWxGs/EKkuebxM3sub6me+P4ErBXf
         WwqPISIhJb9nsrpJaTnAFNmOWCrukYD6qT2wn/cxzjtMz/6Vop9OL9DcHizYhU7cyLMv
         uu4Q==
X-Gm-Message-State: APuU4Z+R7mYqVzDs33SCuEhLIsu9KI238qmaOBpdThpmPO3UknH64Svx
	I9YIJwGeZIhLbzV3JLyNHQnoqddIF07th9gq4K3Y8LDinbBYATFD6jlOb9Yf/P22
X-Gm-Gg: AZFdTZcHnPyuES4uCtvJJ+kHZ/agA4R5ePbS1X3+QBDkxSw+stYMQAKAFYh2ONX315B
	aDTGHXh225w/oLsGUagzIrifcroCZ1oQRULCodip5Y6og4lbGzyq/DOxT7HG91P9b5/VerElSR+
	BkCHbYIuZ0TGIMnX7+M5CR10B1AvOLK2ZBRaDX8CUMSftt1xn2b5TPiPxrR7eq67cAb1pRDEEM5
	s+yqBHutkT6JOGMuu5I0kLH0FK4RHtzb6jrEkxARcglDDdkLXU1NwhN9+XPavybkrVehgiaF/V2
	t1AcNwusx45KieC1Hy50tuGbh731LFKDxBfQKPdvIRPL9UBoe9uHL5QLN/3q6CCNrFwovmYEj3s
	4VsuQ0Gg+xkHXfgDvlJXoIvHh5cv62LwdMVXG/+uW1mGMEu3pyIbFU/1jRDAdLgzpvOqZ+lgvBA
	Vx2HBoy+XuGHrEN8fVP7I7RJZ3xfrGgg8sabif4B4Ta8EBBQLeIYn7x0xdqx0VTVvGfjP/2O4Y1
	7vfzPBowA8OkFMqKFLXXIMFeh0CYLsGry0mUYIBnlZcvr52Bm5vcbgwJu8hCWc8uKNbwT8TygaO
	58+4xC7mHI+e2+W600awwivQVR8854vJA4Pjl6ca+YnYZmfECzt49s1O4lGfjBb3RsGTSQnegMC
	9DkIQlCQ1Y2hjtX3L9lgI5hCAMOUB1l4W+mhK9H5cqoWCoBWAmHYZsjGmthUecpHfaF6JZeqU
X-Received: by 2002:a05:7301:6407:b0:386:2300:db04 with SMTP id 5a478bee46e88-38623101ee2mr21570735eec.22.1795711339632;
        Thu, 26 Nov 2026 08:42:19 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm115299825eec.3.2026.11.26.08.42.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 08:42:18 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: richardcochran@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	vadim.fedorenko@linux.dev,
	andrew@lunn.ch,
	linux-kernel@vger.kernel.org,
	arkadiusz.kubalewski@intel.com,
	jiri@resnulli.us,
	jonathan.lemon@gmail.com
Subject: [PATCH net v6 6/8] ptp: ocp: correct the DCF output frequency
Date: Thu, 26 Nov 2026 08:42:07 -0800
Message-ID: <20261126-timecard-driver-v6-6-ahmadexp@gmail.com>
In-Reply-To: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
References: <20261126-timecard-driver-v6-0-ahmadexp@gmail.com>
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

From: ahmadexp <ahmadexp@gmail.com>

The output selector table uses 77000 Hz for DCF, while the input table and DPLL frequency list use 77500 Hz. Requests for the advertised DCF77 output frequency consequently fail, and reading the output reports an unsupported frequency.

Use 77500 Hz for the DCF output selector.

A coding assistant helped identify and verify the selector mismatch and prepare the regression test and changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3457c351958d..6bfd5792768e 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -1373,7 +1373,7 @@ static const struct ocp_selector ptp_ocp_sma_out[] = {
 	{ .name = "GNSS1",	.value = 0x0004,  .frequency = 1 },
 	{ .name = "GNSS2",	.value = 0x0008,  .frequency = 1 },
 	{ .name = "IRIG",	.value = 0x0010,  .frequency = 10000 },
-	{ .name = "DCF",	.value = 0x0020,  .frequency = 77000 },
+	{ .name = "DCF",	.value = 0x0020,  .frequency = 77500 },
 	{ .name = "GEN1",	.value = 0x0040 },
 	{ .name = "GEN2",	.value = 0x0080 },
 	{ .name = "GEN3",	.value = 0x0100 },
-- 
2.54.0 (Apple Git-157)

