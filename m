Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795032308;
	b=wxT30wEOPu4Xylrlh1+1doowqnrNEYKXhCVbu7HRMj9mwGKfzdyRndRs83mCqI2ERmnT
	 eQ6xsQvv+P1uYRiDhBmAHnpnYrNF9S3c8Pbt0jWPVd5DA8xOYrOLBcoEmoMH8q9uO9nFK
	 yfVRvy0hsuOlpqGOwomOYyOpZn83AcSmIWIluTlQ6B7v5A06TIG3NDDIGfe+35U6wsI96
	 FUVE+4X5zATviWJ2SpgmbYmLed9W5ivt3TmHjeIio2qnCDyLAPOI6qJcFhObPOMcDJENw
	 N/Moj0wjHVJd1QzBiwC10LO1mPfocZdg5TIrKeG2IWl+grPrjU+Ca6m5Nu9TtNljpyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795032308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=z+2tht9hWpEGbEFYrk0DIzYT54hNPtpFJmXd2hLjDks=;
	b=V4diKaNZ1pdw2h48fBDxHWArNt/ZpipDajRdAo2xAlfuRdRqLT8bow2kzIzieE71sZBj
	 fXttT/Bh/cxFJJjsL6Q+bMsk8nTHW9eSUzbE+oBy+eM2ctO0jVM52juINFD12s+JIW7Rw
	 u6zXphPtCGPu++8M7kPdNqJZLmyEWXraBzN6xLO4e1mDGhD8cUC6h79pXbKlHF37mczUZ
	 3L6CJTPxJRqTe/UNkeVnftNOkPrPG4FRQxRKRghf0tRFN9GJtKsmMivvRgwLRhfc3Rxk/
	 EebT2vM5j+Vw6n+r7dFG++kgB/2moUp4ns/aQc7ndTLutOOWs+YACVoVITbfLujbTWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQvqDo0a;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB8D606A32C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 20:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB8D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQvqDo0a
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so3345482eec.1
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 12:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795032307; x=1795637107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z+2tht9hWpEGbEFYrk0DIzYT54hNPtpFJmXd2hLjDks=;
        b=cQvqDo0adnK7+j+Y1uo8XzQfmY8Bo1NulbOXDjMiiFgpH44YZ3VzH9cEKtEfO8Jj3H
         vJShE8R/Sl9AQPchvwmBfYUD9jrGg6rc7zAKv1rfdV3kjCBwwIMqE6zFJtYgQZuPkV1g
         RlqAjRa98sR9bpQYvtwx41D2DOkr4AaVY8ok5QEM9UnD1K2rPiQNyrdB6qPxh97wARzn
         9q5BfbmE1BlfuwtLAMaDRLXwipLCK5W+8fLykjOZLPQudmUW3g0V50k/1A/3teiZsmiL
         fIpzX//eDzY8WEZf99bw+VeyzopJx9OOqD9fBNkwSc9tYOkrfBF6m2SJvd4i9HSVoEXn
         xWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032307; x=1795637107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z+2tht9hWpEGbEFYrk0DIzYT54hNPtpFJmXd2hLjDks=;
        b=eWhv6UWQC2p/iZAdTWUp9S3FtQlFGT4z/56VcBUa+V2554M8365E5R4aMeN6hReuF0
         sR2vTT+sj1aCeaEykXrlMJRloTQEFuqIB2ORqYE0PzBWruujpm+mOZXocqGmwIuf5hkw
         ah40XkuFBTinQN5EDshouJr4cIzFn99049z+OW/pEdIk5jz9rLfJkVL0kHtAoWe0ayt5
         NmybHHVEQSvlZrH8PAywJiQtURl5Wygl5KLpQJ+IyLpameoK8rBLbVi1uxTynEsNz7/R
         LgmKDfXtTGlTFdAPAWiCINBUOESkrzSmGKyE+Bl2bHGVhWLJLCT5fdto3fvMRXiG1iy7
         oCPw==
X-Gm-Message-State: APuU4Z9nksXsFfOUW6TOC8cRYgqo+L+EZLwCNdXXcVstbt22UWT9xdqR
	xAuE6mxNXcUVh8d205pU9UkQp228pJUetfDHerKTz5jJAM31JYsOzSzVnuFLo8GM
X-Gm-Gg: AZFdTZcRB9oC8gOULJwO42zqhn58VYvJIo6Bom1TzTaj3elwA7fPP/aK4vkXU7C8Wnw
	8U4aMIvD9y6+tXBHeY1S3iczQFFuU8U0Bq6utPsy4FbJ2rp2rCpv4eyzvmiSSMPx6poCxCFo6U/
	8WphTb1RQ5KKQWkKghQ8IyOH0urav5s9YQa0drczDfV23wJv445nQQdx11cHOM5d73G/LufopXH
	8rFrW21KG1JRvVIM5Nwns/9VeLV1iLLE1pHCUE00x133tDphLD7ZhZHc2TS4HZiu4HSVajDRHs5
	6h7vtQFOiw7zeXF5YKPheA7uQNyEawxYmPhvP+yLqlAyEjVlfu81ze0u3k7pXs5B1z+3nNZipyR
	jvV5q4UilWZ1PkmxY38m5Zzx0vwRkycbJ0qq+XvZy2FMepwPGDNHhzwOWOUyJN3cUwbQLG/Ho9S
	vjH4pscAE3l9H4VZ0EI7SUbZm33W/HbbdVucUfHjx/SwuDHAvco06/jtSqwzv1cMrjalNYPK9vL
	LCdRx/yK3ZKuRlX86Bv4BqVuCoYPdhFupC6VCyIJ0gI5ROnccNKGQtnqM9CZwakqUFsrXQPeJTw
	7XcpjxhW+FGvtn14Q/a2xcj942pk26of4Clu76I5RvaHlakDqwLJG3gAkctIWsx3Z4IeiqmiKzr
	v99HwYU6Mw60U27uD9FgoWDpO+BDL
X-Received: by 2002:a05:7300:2150:b0:383:bc0:77ea with SMTP id 5a478bee46e88-3830bc0895fmr2635595eec.30.1795032307141;
        Wed, 18 Nov 2026 12:05:07 -0800 (PST)
Received: from Mac.localdomain ([12.162.234.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a6fe75b5sm9452407eec.15.2026.11.18.12.05.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 18 Nov 2026 12:05:06 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev@vger.kernel.org,
	vadim.fedorenko@linux.dev,
	richardcochran@gmail.com
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com
Subject: [PATCH net 0/4] ptp: ocp: fix timestamp teardown and DPLL routing
Date: Wed, 18 Nov 2026 12:05:04 -0800
Message-ID: <20261118-timecard-common-301f823ddd-0-ahmadexp@gmail.com>
X-Mailer: git-send-email 2.54.0
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

These fixes affect existing ptp_ocp boards and do not add WiWi support.
They were identified in the public review of the WiWi series and are
split out so they can be reviewed and backported independently.

Prevent timestamp rearming during detach with a mutex-protected stopping
state. Then correct DPLL selector values, disabled-input frequency
reporting and the DCF77 output frequency. Each fix has its own Fixes tag.

Validation used source-derived C tests under ASan/UBSan. The old source
reproduces rearming after detach's disable. The new source rejects late
enables, waits for an enable already in progress, and drains a mocked
active IRQ. Targeted mutations of each DPLL fix fail the regression
tests. The driver object builds against this net base with W=1 and
KCFLAGS=-Werror. No physical card, real IRQ delivery or in-kernel
use-after-free reproduction was tested for these fixes.

The report came from netdev's Sashiko AI review. Codex prepared the code,
tests and changelogs from that review and the upstream sources, following
the request to separate common fixes and validate removal ordering.
This origin information follows Documentation/process/generated-content.rst.

Related review:
https://lore.kernel.org/r/179502617840.3136.12704245716223038161@kernel.org

WiWi v4 will be based on these fixes after they are available in
net-next; it will not carry a second copy of the common fixes.

Ahmad Byagowi (4):
  ptp: ocp: prevent timestamp rearming during detach
  ptp: ocp: use hardware selectors in DPLL frequency operations
  ptp: ocp: report disabled SMA inputs consistently over DPLL
  ptp: ocp: correct the DCF output frequency

 drivers/ptp/ptp_ocp.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)


base-commit: 2a324a58a084c5cfd7e5a2f55e0786bee170a4a5
-- 
2.54.0 (Apple Git-157)

