Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.79.23
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421023;
	b=UAmspuIxVcIztTztMrzOpzyvk4CWr5Wza3/BwMwBax0SkmZzWEFNpAOS7mLCOvGfCKKZ
	 C5ZavVN0ui/ApeLVGeYo6R0Y2wwYC11xHpd7/VxyRIQEDETThG6CdBqnBc8WIwx+ibUbo
	 H1o6J6SzcvKnH+bjO8OV5cvkmSa54FzNKim8LvTi4zqM6HHogx77fjK3q8aO74BMhgP2j
	 rbX0cMFIzFlO+A6Q4Gqy2MKWNh3UhpitePMYudMXQ5p3AkAew0tO2QKYjZ6sCTL1GU6Ml
	 zDpyfl/yib9SxNnLH4HpKmcse5FiF79VEGKL/DDIdUcHHxhXGGOcFSnpnE7kqLa7S2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421023;
	h=DMARC-Filter:Received:X-ICL-RepId:Dkim-Signature:
	 mail-alias-created-date:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Info-Out:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-JNJ;
	bh=JYvSvDfswO2l+IyLzWQJX1wneXOmcrOuIQ0XsfOmxLo=;
	b=sGHyRmzdrnZcVgdr+2nwLQuYI5SgtLVaMjoowx7RBydVNbHnTR5SJMeUI87CFkXolW1D
	 BviKTSm3vP14oMNs+ol7iZNX1Q8kqXJ8BKb5pIe7ZJhUSgY/LnXdn9CNroFh03mxdTXSE
	 8LuTG8xMOq0tz/8PK9sJQ3+BM9Koa9KMVUuFSRFXPknkfqrg6ByOhI8fbI0C+7ctHsodI
	 EaiAnLUvjTaaWRKfGMSkFHYGUl6dmvSKHp+61WQxE/IxAFwoptXGJ+I/wHVL98MrepFqE
	 vBSuxUqt8D6S2nd0qbAgbG0VB50ucZG+6Resnuq1PWB9jXjZJfX3YZSXe05X8hsI+xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=shuye.dev;
	spf=pass smtp.mailfrom=shuye.dev;
	dkim=pass header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=vpSzqAyK;
	arc=none smtp.remote-ip=57.103.79.23
Received: from outbound.st.icloud.com (st-2005b-snip4-11.eps.apple.com [57.103.79.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482D0606A69C
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 08:03:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 482D0606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=shuye.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shuye.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=shuye.dev header.i=@shuye.dev header.a=rsa-sha256 header.s=sig1 header.b=vpSzqAyK
Received: from outbound.st.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-0 (Postfix) with ESMTPS id CFD851800218;
	Mon, 23 Nov 2026 08:03:36 +0000 (UTC)
X-ICL-RepId: 01a2076e-9277-7aed-a86f-ebaadef8294b
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shuye.dev; s=sig1; t=1795421021; x=1826957021; bh=JYvSvDfswO2l+IyLzWQJX1wneXOmcrOuIQ0XsfOmxLo=; h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme; b=vpSzqAyKYN9JXypjsE1N4TUp9scJJooBDOprtbzu8ybgNoqq0JJ649kUKH8bNeoAZtcRF+YUTxi1gHC1YgTdD03kMAzwYvk3LWptgekTpaEBM2b4GHD79c0QCJmjBTnEkL88UZsP6AdNUqaWO+3qtdx+f4Iu48OISYhrOx8gePBUVDo0GxRvR8Eo9EBZzjdpKA1fBMkTYF1jtKuX3lMq+rz5kIQpLZj6DtVTz0ernGYTJC1M5l5qA3HYqcUoqPW4yZMIJJEqZ8hARTd8m30/ZJzxwyD3P9VYMRF9t5lKcBR9Q+nFZU5GgFTtJFr10ZG9OmvJgAVslXvYzH2dTH2DSw==
mail-alias-created-date: 1658105457252
Received: from shuye.dev (unknown [17.156.216.30])
	by p00-icloudmta-asmtp-us-east-1a-100-percent-0 (Postfix) with ESMTPSA id 8A3EC1800208;
	Mon, 23 Nov 2026 08:03:35 +0000 (UTC)
From: Ye Shu <hello@shuye.dev>
Date: Mon, 23 Nov 2026 00:02:33 -0800
Subject: [PATCH iwl-net] e1000e: add HP ZBook 8 G2i 14 to disable K1 list
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
Message-Id: <20261123-e1000e-hp-zbook-k1-v1-1-468e3868229f@shuye.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/x3MUQrCMAwG4KuE/3mBpCtOexXxYWp0YdKOVlQcu
 7vgd4BvRbPq1pBoRbWXNy8ZibQjXKYx3439ikQIEnaqIbCpiBhPC3/Ppcw8K0cb+l7iuD8MER1
 hqXbzzz89wt8PzvbEadt+Vl9Bvm0AAAA=
X-Change-ID: 20261122-e1000e-hp-zbook-k1-4e73304a8974
To: Tony Nguyen <anthony.l.nguyen@intel.com>, 
 Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
 Dima Ruinskiy <dima.ruinskiy@intel.com>, 
 Vitaly Lifshits <vitaly.lifshits@intel.com>, 
 intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ye Shu <hello@shuye.dev>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963; i=hello@shuye.dev;
 h=from:subject:message-id; bh=Tk2kaEGBsjUU2+Xrzlzb0H/K/d1lZQi2yqEQQz5/qho=;
 b=owEBbQKS/ZANAwAKAWrdZni68N7qAcsmYgBrA/NWcuNYDo8u4aF8qMy37Q7bnFL1jtPHc127Y
 fSZwVz3epiJAjMEAAEKAB0WIQTaiAWzOwE7Z7uq/ZNq3WZ4uvDe6gUCawPzVgAKCRBq3WZ4uvDe
 6ta+D/9PwriDv8XRgFc/U/kIMVeThj7EebTpGu8kcFwMwPsYQfxspAmTPn0tKF3/vi0XHfE6PK8
 IpTOaWsx2+7gJ9Z4wfQqJA41HgB7/DntHYjBI7IqtYRQFkuXX6D08mqwsCX4AIuVS9jLmXZBD3H
 p343xw0GhxXgCBrkAHFvdWGQ1LesLZM6TMNyj9Jj0/9F/DwTRD62j9jyN2YbO/Si1+nzP4Y/Z1v
 y94bHqEX8k4B/Ja37S9fkKXfur3hZj0ET7RQwcStQpBqKqE8UruMMOcgHb+/3dm6pIOT7ZCWg/3
 n6Z0v7z3omLI/SQKT/XtWP8RhkibKKEbEadUtb4CEwm0qtrrrmivtHO7LOngxTDz4y0MQbdNoYq
 Ij00FuanyDh2sSP3fWS5JkdEm008xZZVytCzZiyRkpP6QVa7806KG8TlTus9NswYDk+NtTNtoKU
 cY/2aGuz/O91kYMJCoCC2ZUM2K46yjAmYCmvwUGnYkYs8CEv00VvPV7A/gYNCYPzjhi0uPDjbQW
 KX0w7yYGblTk67HJCNWJwvjex91oBSxoFxPVhb0smawe/0g9mIoH9adAJDFXlUPqgxadj6kVJtM
 HHnhmBPZrQSOdCNzJVtiQ/P6plZQQPfaTjhTzSUAHPilGlKiVm3gaqfVkX5nyAUf4f8brGQQu6Z
 7Q/kxBZbRey/D1A==
X-Developer-Key: i=hello@shuye.dev; a=openpgp;
 fpr=F021058172993F4D228EDB6972FF4E8B377057DE
X-Authority-Info-Out: v=2.4 cv=PbNqFShd c=1 sm=1 tr=0 ts=6b03f35a
 cx=c_apl:c_pps:t_out a=oyWFxbOnq+dmhQrAPgaJYA==:117
 a=oyWFxbOnq+dmhQrAPgaJYA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=AZoGnDOZhPiq548KR6q9:22 a=oPt-bpzCUupNiBt5qcZk:22
 a=VwQbUJbxAAAA:8 a=qnVDHuHs7DX7YdgB2tMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: HdjXjTci-5tB4pFkOoyDrfYGc9KzORrV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzMSBTYWx0ZWRfX4dEOGQjMgsGb
 Lq8PiPHkbChVwAzgBEyVPOnoyjH9nfyS8wax6h9TF9w+4JE+1nDE5m6XBNVf8sHvC93EXM5zjJF
 qTFSQbQDsLIDGr3GCIIit7o2WxNZ9V4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzMSBTYWx0ZWRfXxvq+SjnGHP7y
 1v5u3GOhL+kM/QSiRiniwLbclc48zyT596Pz/Si4PvCO7XwsZsCNj3rlk/qsvwr9Y4kA3bziLB+
 gBdVIt+5vTFBMKE0SW9mMW+DOOOA6YHSD8X1bmQhhayWubK8TCuAhEzbFG2toLFSHOQoJCO9/1m
 IjiWLI1U8JXp/Mv6VZM9Um7BDMWMJYSC8Zq+gv0I139zl9czzG8bDWlVMpaUufQqcKA+V6kZS4i
 stUZxOG9hVsgsJi2Nta6zOcq/8GaIm9+vRAc9LmrnQRDS+zT3nw+ueIdF1OyTtb6iaePnS3pkWn
 vQQBPp8Vjw4osSYmVrDKdmdVln5x5qMru8iGwQrBP8SPDqNj6GFB3qsNi79vAs=
X-Proofpoint-GUID: HdjXjTci-5tB4pFkOoyDrfYGc9KzORrV
X-JNJ: AAAAAAABLlj2GXMfJgPS6ZL5RRkrN0+SR9VBuGsw3ND80RiAZpzRIEpF3Dlr9lyz/ynVjv
 Woll1dMWwHn2JnSryo5B/riTWwepCRbUINaKzGdbvPQcwCZN6SbfbWpJHs+VKUJnub25Ju
 1TqG8so0rh2Y1cGCQezxCSGburtFMaicUlhIdu0+4wG716e01ONFDv/d/AGtHP1H075Ajq
 lLcSnGpeSKw5NmbLzKFW5P50jgVsgXqD7pM6YUTOkXauYJfQKZXBuKPFxk7PKuNCu090qm
 /cm730GZmSPqO8nBI4YOGujMY5MZPoyC7py6TtDMA8lBPnv870rvR2D8b9yr3vWSJP2u/i
 ts0vQLlS+op+Jjdi4MZAqB9Mz4KRwB7xYRzJnGhyq4tKPIvMJQPzqrlYgbmnLVVcHUmnsw
 OBsrTTEieovBFBN7yZ2bIjBW4an27t0TXj4g4OFbqMJAUSuLO0Vz/0ItV7oPur0cL4uMHF
 +3V05bLAMHFvTaLMpLP9zk1xFcLiK3y4f+JTA+wpOrciFZykHtyqIEpNHCSc8+8gieZBZQ
 zaBS/5XBcZiYqXkF2/rNsASE9HieRLIik+i/SawHxVVkmYjLMx8JjLIk0A+yxkTC8DA88W
 CZC5DGnLQWLUObAhIxJQRPt0+F7djNQuuTueVyHBpcSw/9w9U5SqqAXvSQlwsVQVgb8BeD
 NYMpVqDWlCNsRcRRcGaBU90sKslSF39d5/+YofUHbubxdsLoL1OkrNkhh0D4Jn1VzKCvQU
 T2OgJO49U6BB9Rckz56in4r1oKpN7wlW3D41ymp8d6Xj4dhV/0a0sGPxkQbo+Ly78qPuLN
 P2Vko0tHM4/nOFbtttlHgMSKkz8cpkJwAQ+FusSMJ7igDBAIeL9sTdqt32dmkOVHornKi3
 jMYKyCGe8pMXUdU5zm5LukhNcgXqpDI6D0+D5VZLHPPmWWzbVDwDwP7Aa47DXV5lPzMOu3
 c3mhHxrn7hFAvpMXq9SxPoVY0qmBwZZF2ZmMJvRkficN2bq6qnDVj/seezgHGlSDw4Y2VX
 L4r71T9eJpKSdhU7dDniikf1mMKz17Q4qKwA46U8a9Vm7AxSyGZ21OnzMvBGR4rhlaU+Ap
 eW2y4d7RmM59inRS/ti1bUVE17iKI2QYTaoXQIiZWqt43XpbWz60K0IU6DSuDiyNbUC7Ie
 cIYRM8AqmCC2pgnnm4CHjzIxbpjk8uBDKnY4lb3UjJfFh/P+FnuS1rTfIyliRO36G4KMc+
 1qyXJsYEXAqBV8UxRo5csaxTFj1wQmgJnrwNHcY2ufDJHv88Ktsx2twHXzgviPQtHRedPO
 pXrsF3qCHU6Ual4AREoRahTgsezTbGTHwA1h9hbRxIY2O/Enczai14Itl0M3BzBGUh1+jc
 lX+MQZIDg9ogOXz5ZKmwTwGFmLhSnPmZms14YraQrz2SQoQv+ehYLg==

On the HP ZBook 8 G2i 14 (Panther Lake, Intel I219 NIC [8086:57b3]),
enabling K1 causes intermittent failures to enter S0ix during s2idle,
despite CPU reaching package C10.

Failed suspend reports:
    intel_pmc_core INT33A1:00: CPU did not enter SLP_S0!!!

Disabling K1 through the ethtool private flag restores reliable S0ix
entry:
    sudo ethtool --set-priv-flags eno1 disable-k1 on

An A/B/A test within a single boot, using 120-second suspend cycles,
demonstrates the effectiveness:
    disable-k1 on:   6/6 successful (~116-119 s in S0ix)
    disable-k1 off:  1/4 successful (118, 0, 0, 0 s in S0ix)
    disable-k1 on:   4/4 successful (~115-119 s in S0ix)

This fix adds a DMI-specific exception to disable K1 by default on the
system.

Chia-Lin Kao reported a similar failure on a Dell system with the
same NIC device ID.

Cc: stable@vger.kernel.org
Fixes: 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and re-enable K1 on Meteor Lake")
Link: https://lore.kernel.org/r/c4801ff7-7ff6-457e-b0a5-c2e633d35c59@shuye.dev
Signed-off-by: Ye Shu <hello@shuye.dev>
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index 6f85dab5c..060a9bcdf 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -74,6 +74,14 @@ static const struct dmi_system_id disable_k1_list[] = {
 			DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad P14s Gen 5"),
 		},
 	},
+	{
+		.ident = "HP ZBook 8 G2i 14",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+			DMI_MATCH(DMI_PRODUCT_NAME,
+				  "HP ZBook 8 G2i 14 inch Mobile Workstation PC"),
+		},
+	},
 	{}
 };
 

---
base-commit: af6737b9066832a2017c281159950ba92385ce00
change-id: 20261122-e1000e-hp-zbook-k1-4e73304a8974

Best regards,
-- 
Ye Shu <hello@shuye.dev>

