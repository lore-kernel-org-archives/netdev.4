Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794999082;
	b=PzOCzq+cx7g+c+WODHAZGdD4JplVY9FdLWJsrL+oFg7ddfTC5sEM1gFgZaYYxKR6bOCG
	 tH8ohTVXgpoSQSZiwh2abYWKHbed2TeyP0NzIOd05F2D6Uf8zc04t2+jngOLsn0YKjPoZ
	 0MTvros4R6/ClqD9cHmDJ1TD5o7PouV/yodtjbXQ4S2f7kfSHN45miYAEV2u62eKctyQt
	 g59CbN5JV/DOYAjWUQQcLQNbUgGlvG2JGUqd1/qoeB2HE/g92KNuBBFnNLSfSgyIplnMT
	 u9hmMU3Vh6jy6J7n4NYgLO7DKpQAjmrVipeHMGur9VQbe4pGSG392WvQTPDwwPgjW7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794999082;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=Gz0XIR6HPcE7gvzbwgsKLnzMb6jW1gJw2yZlCt5orjE=;
	b=GKzbo7tD7ADK2iH3NcKTU4mZh/zOyd5OWmcY3bUqcKRO0W+AWHUVPQQ+RLoYPdjqX7gF
	 n/MngFJXEAvBMHphEXzps/Tol5jJC7/SubNIYY0dcuLAg5xzNl45WI5rOtjdw6sI5U7YN
	 58dbtSByK3VaYmhqT+OSU7F7QXMwo+NT0G2iwxHhcjBU3P1C5EC6eQDjcFq0oFmMmEGMG
	 zbFGUbr2oDkoC5VQmNU24S9UJhCH3rNZHAKBJt+gNjeM1azHlqwl+ciV8gWJj3b/bvoAI
	 qtHCFU0fL/eOpfFmrlSOGb3RgzdS3jdCM/0GbwnYC1BKeqj5oSBipnFwa/N8Bh6Q/MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JoNVT9Au;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F4A606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 10:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84F4A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=JoNVT9Au
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b37951a397so627523a91.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794999081; x=1795603881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Gz0XIR6HPcE7gvzbwgsKLnzMb6jW1gJw2yZlCt5orjE=;
        b=apFfRQuUIv8VLdjyxRsOjAPCreRjTYk2ka2jnyk4MqYujJwcJWb/ZhDIPbOrYF6JZC
         WTRJPSwx/FpUjIslCBpo/19FoxqFNghXyfO9HCCe9r9lZjVHqRq3wxTbjI3eCwUeBKj1
         Qul8e/MBbxoq01WqQY0RX7y/0Bj51ya4ngEPAclyJOyhCCF3qEPsJEAfizQvO3HX5X2i
         W0fg3a/mOpjyk0WXFyVwoExMGJ6HYLO/3NRqiJHGGd2s8a/IO2DEdhd8syzDPXZpN/7+
         NR/Da9zrbLK+Bry7OIZYtt5w21+c1WHDd6IPrIbkAQQ59udr92x9MDHMA6zIrrKiGiSq
         pc6w==
X-Forwarded-Encrypted: i=1; AL+hErFObsHfmENr/uyFhUiAXQvthHj9RJJ1L5QpWQFR84MCGhCfftAlyoB4NB0YDtW0DfL2WqeTamQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8balWmoxXlhoctTL5Pjy2PAfE0lzMeaP7To9pC9dmyJD9Dkrn1
	3etqXmGZmLBk1msUxUpl31KMMSvbAYU+kb53rli0k6dWH1yDvVrueIdCICSRXAjaY3ebTgc1/XS
	+lrNQ3tIDjxlq9qIDeW3XvrRUrGxonf+LcKYIWBRdhktrjBozUc3tLWO3ZU61QVnumh0QaTvra6
	VO8ffKCsofvbPzItDv7TZM2vpWpMgQq7s/PVf7Ck8RDIYIpbTx/EiRE9zAhKLpWMmV3AhKuHYMt
	rrB8W4duPU=
X-Gm-Gg: AZFdTZcAp1rZII6eoA7K0ZfIdU0YW2t480p/f3ZUeTARY7Pi/SV20KTZQevRgx0LjbZ
	PYiFlmpbO7KOrx5vPYU+msJZC3TL/Pn5KUdjJD8ukaO3wsPm08cNfsgAWJ76vv9ddJoZ6rHpHfl
	85bOwPzvc5ErpAyRqq1r7fW6K1s+ehwantTEF93c+MQZ2LYskv+OXpMPf2l5orLoxxfe5dx2sli
	Vg6GzdRpdkQoc6NWVVvUYmXQ2tfkdU1AXo9AQ8+dqxfCosSxs2nNJOZkoMWe/ySnT4gI380y+lW
	W4W6bLaXQ6DjgaH5TAup4z6uiTZv9ps1VMgEAKld4oyC2bnHH+vpz3i3ndSBx14MrtXS7XwhfFw
	pGLnOD5f66M7Hf4XR73LRXtQBl5Y1Tw6chYNrhK5zpTnpt+rGjg6/Y5nAfXESFgbHOlcPONuU8B
	5lC2Luv4w7vYLpS7YUMEhdha95RS8Pq1OA00w=
X-Received: by 2002:a17:90b:5803:b0:3b3:bd07:6646 with SMTP id 98e67ed59e1d1-3b3d07e0c33mr2211334a91.52.1794999080676;
        Wed, 18 Nov 2026 02:51:20 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3d14c0525sm1672766a91.8.2026.11.18.02.51.20
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 18 Nov 2026 02:51:20 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-370230d93efso3316462eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794999079; x=1795603879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gz0XIR6HPcE7gvzbwgsKLnzMb6jW1gJw2yZlCt5orjE=;
        b=JoNVT9AuzyrF7BK4oFaIcOrr54KIPmomG7I4bgwRM/r2Z4EXc7iBmff/FR81vQSomU
         xvMCeViylJYYd8iI0a5kZIgT3HH6kTp9Uh3OGhdAiLCp5Tmr9sZysLQGQTxK+nvA607N
         O1L0co1dYxYrZy/vX4ovSMBEKzGkthrepvheE=
X-Forwarded-Encrypted: i=1; AL+hErGLTCH78clWLEwlsO/SCYLYwT0HjXOq+Mo27gMX3HP9wsaQiaUdU1yfaLG3LrwYn5SZkqLmR10=@vger.kernel.org
X-Received: by 2002:a05:7301:77c6:b0:36d:4570:a32d with SMTP id 5a478bee46e88-3827d71eff4mr2193126eec.2.1794999078724;
        Wed, 18 Nov 2026 02:51:18 -0800 (PST)
X-Received: by 2002:a05:7301:77c6:b0:36d:4570:a32d with SMTP id 5a478bee46e88-3827d71eff4mr2193088eec.2.1794999077777;
        Wed, 18 Nov 2026 02:51:17 -0800 (PST)
Received: from pc-hpe-top-git-sendmail-server.dhcp.broadcom.net ([192.19.234.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d401fsm6609311eec.20.2026.11.18.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 02:51:17 -0800 (PST)
From: Pavan Chebbi <pavan.chebbi@broadcom.com>
To: michael.chan@broadcom.com,
	kuba@kernel.org
Cc: andrew+netdev@lunn.ch,
	andrew.gospodarek@broadcom.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	Pavan Chebbi <pavan.chebbi@broadcom.com>
Subject: [PATCH net v3 0/3] tg3: Bug fixes
Date: Wed, 18 Nov 2026 16:24:05 +0530
Message-ID: <20261118105408.1076095-1-pavan.chebbi@broadcom.com>
X-Mailer: git-send-email 2.52.0
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

This patchset has 4 fixes.  The first patch restores probe on 57766 when
the 31-bit coherent DMA mask cannot be set.  The second patch makes NCSI
PLL lock on the TLP clock to fix WOL at 1G speed on 5720.  The third
patch fixes ethtool -i display on 5719/5720 when NCSI component is
missing.  The fourth one fixes a possible heap overflow in the NVRAM
write path.

v3: Dropped patch #2 (PLL clock source) from the series.  It is being
    reworked and will be resubmitted after the reporter has tested it.
    Addressed Sashiko warnings on:
 - patch #2 (was #3 in v2) to describe the version register as holding no
   valid data, instead of "uninitialized memory", to correct the Fixes tag
   to 165f4d1cb3d7, and to document the return value of tg3_probe_ncsi().
 - patch #3 (was #4 in v2) to reject an NVRAM page size that is smaller than
   4 or not a power of two, instead of only a zero page size.

v2: Addressed Sashiko warnings on:
 - patch #2 such that the PLL clock bit is set only at system suspend and
   power off, cleared on resume and at probe and updated under the APE lock.
 - patch #4 to reject a zero NVRAM page size and to describe the buf advance
   fix and its reach.

v1:
https://lore.kernel.org/all/20261108065526.710152-1-pavan.chebbi@broadcom.com/

Pavan Chebbi (2):
  tg3: Don't fail probe if 31-bit coherent DMA mask is unsupported
  tg3: Skip management FW version when APE firmware is not ready

Shravya KN (1):
  tg3: Fix heap overflow in unbuffered NVRAM write path

 drivers/net/ethernet/broadcom/tg3.c | 43 +++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 9 deletions(-)

-- 
2.52.0

