Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795399068;
	b=rFIvqDSfrCPHhscVOa0+bdKUrBGrUyvqiPu6mtQoX0AsJErXCsSEJ8AXerga72r6x2Mq
	 gW5DU6rM4MzhM/3ahXswiatMR4R1wBKcRzP2ak7Y/y5jyViaBZwYsy0jDb7NbUuguxkwE
	 jBG+34XM4tEE7+lCz52o4X4F6zmpLFm7VOYiZlyFKGWGTe6eirOLnGrxu2mcYv/u9LkbY
	 AntpeJrSlXO++ZwEMX1TApR9jltsOC5Ocqn+nx4+dxN6K23hxUHUPRoaGkDIGkPDWxSM6
	 lT4Ao8JcZJJAiyIu9wOoGu3nApn1WBdEiO7jtg7zTmwOf8fKYkHH/4+G+FnHviGDkFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795399068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VZLwpPDij9JUW3KCOLKG+tXmQBD7Fz0cDDs3XVTWGsQ=;
	b=n51gmh3PyEjRSzd6OR1gIP/ZaxfpuQymWaU9lXDTUWIjfY/U/8kDZW3JvexdgOfXtkuz
	 qkrx3sLQgQH09dnm3XBzoSK/IqR/RMbYA7+yn0mQbeXskbfrRS877EDjCRh7op7vt2MdF
	 UTGIK/W4+wDe5KqhVkUrO2jiP53b2rgk12/a9cXTF/zkrk+CX2+1071eZB63Et2hLYque
	 a6DqAqfDU+V2zzvye57SlmQZFWYZVmfWmr2ql+zoCqDAHDyZhCFAuKj1yC+mJZTQuV2iA
	 FzDkLmUEqtmYha3Eox/bw65bKAz0YPDpWBgbkF8tI7ETtC+u6Ga5XxL17sfqjJys2AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPKpwQbs;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C9B9606A320
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 01:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C9B9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iPKpwQbs
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38699cf08dfso2348228eec.1
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 17:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795399067; x=1796003867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZLwpPDij9JUW3KCOLKG+tXmQBD7Fz0cDDs3XVTWGsQ=;
        b=iPKpwQbsrKk3I/u76gckxA+kxiRRK9YcylH0ljzygDhGy868JCVqLSeZ994kKwrsWB
         MZ+Ae59ZjMhmO0hqghgIGdtdtH8hNd9ghxWw+gXKKBkjf2RRAosu00aMCsWm4s8OCOEF
         ywVapv7CqWb++Rx883J6H+rVmR+whUE1pP/SLGeJzDa8K2n9kPSnTQFhH1T+GdKbGkUe
         ekKA0UrXkLEnrd+40HGR6PoruaDBc9o0yf0wKuVZ0zO8Y0JzkLnMwZtnFVAEWMSFjAUn
         nHrtkMcV6/A4AP4+TTjNwocZCmV5ywo6XBT9CF100hMBHH3I2yZ3wOXZNqI8n/B6lEBb
         oYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795399067; x=1796003867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VZLwpPDij9JUW3KCOLKG+tXmQBD7Fz0cDDs3XVTWGsQ=;
        b=p7HaSY3dIyjLLcnCvrWrM+Je5r9AFJjiWM7c3yiI0RG9EJ6M+vKISaBa6qE46SXQSj
         3dqAIKqIzBxNtm6sNrp0R3WtccNFiFLuA2GdtpOR9c8/xboQ+P8jkCx3CoRO8ts5g9Nm
         EClJACVoDkVwf/tH15cAA3nTMWEDLjktd67mr9FlF7JIsZRoqpWr6VguHvra+6q6Vc5t
         DquWT60VQPikUDaTwHmCNuyfU+A5VHhW19/GB9FtkzH1TpoBZAdP7iiNewQVOVjpRaW7
         h87t/4DalBAmZ4gxVlwk+MwCdgJxGB6sBEbK2F0uk9bRPa0RS4pdXp3SEnH5SC5YbgGG
         uxmQ==
X-Gm-Message-State: APuU4Z9ovKaPaBD98N6DXPhlnPRSaKI3VjDiBKrxXk+uT/zTkcRqZyeh
	0MHU/xYFP0QqsZSVDaV2CIWl9fgmMH3iKaKJJM+WLVoO8JOrywSSejE+SexZNXsH
X-Gm-Gg: AZFdTZcofkS2aN9oBTb3/HMkNOUVx8bWITiPvS9m+/vRHTk11hOz+HhZFYRnCRcxt+G
	5Bw0R+YiKmKaGC6Avk8Y7ybTIHLaC+UG+c//Uy2KD5qlb3djNcmCir/xfi1dm2izYfpBClU4DnD
	FybTGcOr7wrFvxaudW05Z73Qb2B0MFk0jelpdopthSjCPEbTWw+9L6qChrXy3ULjX0IB3w3wFE2
	nkN4uCjsTTDY0VMTFtXumBYp6aM6BP75/GiDw1w2R3D6F4bJit5xC6UOPslbjyVT0aJPFRzdKtp
	ufIP/1T7gwSIRLc/FSZd6T6OF6TVKhCHtQz3wl0XiT1nQxwT5pbd6dwqKAgn96ctc8lJ/uYoNwh
	Gzm6A43rqmvoGQPuQHhVC+N/kFL9mahsr4VoWOFeV4ukSCBVL5eX48JtcSBibGO1BHeJtZB6LfY
	lg4qIDpwZnStxcQ3TSykGgtDNAA8j/z/DqsdHdexjB35Iowcmuh/KQs4jzdc44T/2HroETM/Bac
	WNMJpLGX3X47BxzwNhoVxoijLBoo9R+rlLiAFksffmH+Aw35Ga61RMkDphlPevgpFbAityz3utu
	e18uHCI5lnecYgTb/Aaejw9uiETW1+F5E7/TysMoqPNIDFPvQe/C2mp+DT/Nm7eNJOYQ4QkgbI0
	TWtFZ+gXQqDS0EEcRnDDfMQ6/qRlyRP5wB32gQXDmtJf+msNd0ndpjiR5lIIDOZAlUVmVuyip
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr8794997eec.34.1795399067474;
        Sun, 22 Nov 2026 17:57:47 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm30096354eec.15.2026.11.22.17.57.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 22 Nov 2026 17:57:46 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: [PATCH net v4 4/5] ptp: ocp: correct the DCF output frequency
Date: Sun, 22 Nov 2026 17:57:44 -0800
Message-ID: <20261122-timecard-common-v4-e0db4ab1aa-4-ahmadexp@gmail.com>
In-Reply-To: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
References: <20261122-timecard-common-v4-e0db4ab1aa-0-ahmadexp@gmail.com>
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

The output selector table uses 77000 Hz for DCF, whereas the input table
and the DPLL supported frequency list use 77500 Hz. A request for the
advertised DCF77 frequency consequently fails on an output, and reading
that output reports a frequency outside its advertised set.

Use 77500 Hz for the DCF output selector as well.

Source-derived set/readback tests with stubbed MMIO fail at 77500 Hz
with the old entry and pass with the correction under ASan/UBSan.
No physical card was tested.

The issue was reported by the Sashiko review. Codex assisted with this
table correction, its regression test and the changelog.

Fixes: 09eeb3aecc6c ("ptp_ocp: implement DPLL ops")
Link: https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org
Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: Ahmad Byagowi <ahmadexp@gmail.com>
---
Changes in v4: no code change; trim the changelog to this correction and
retain Vadim's Reviewed-by. The ART input typo is a separate fifth patch.

Testing: DCF output set/readback at 77500 Hz in the source-derived
ASan/UBSan fixture. Restoring 77000 fails the runtime assertion.

 drivers/ptp/ptp_ocp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index e27abe2c24c7..821ecd1a13c8 100644
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
