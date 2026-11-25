Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795627479;
	b=1coWhsOAeOsWAl0d8OfIdJnjL37w65Ujivf51nex2LjnVXV4ai9a7vgbhdOa7LiStp3h
	 4cjSq96miGAThSF399a/bauf0CeUuw+gCOCVMtVx+zM69CtfFH1hLBwYSliPuCz4mqiGq
	 9toI/kJM2HVj2iPiZvM3h76Q4J2sFNu40xQyDw+t0y3bz8OF0EYzHTCrpw/wjE5mTpxh8
	 +kFeRvoph4SGd+22j0LBxJYrIawdgj7HsaSL1Cvifvyp8wLUCCi5UodhHoMhh/i/ijF8t
	 q+rJ/42zr7Lr0XZ0TKuSSrRv/fJHnLTk4cPLxavCZLr9lk9CgETuCf9NI59rVRcjgrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627479;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
	b=4pXhDNfxfTV3tbjNlFWEkVn+xSQzYZnrzeC30Bn2cSIozd6Fs4Kw8YiXrxKnrcR5OT/a
	 Pus75TudkIMBkdJv0tF//rIDmhy59afFLBDNRTYVIwXnNlm0XNfqUptquJRKEu2KHYRwR
	 oTzZbSVmzWLZMflw39ivyMZUv287l8xYNNwXWYXgVEuCxnzLPZmtoKov4WEYEVaMRSNzM
	 f3dbGYSZUQUBEmK2t9/TCaYfHF52hnwX3GbWZvXlUmeBF8j6O8brNnEXvwvJFveiGecwb
	 N3tARe/FugcocZklrjnLFQmqXa193oC9/kTy0ZYqp80Hs0J8quCFQsHUsVM/4F1h6JA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2KZvUbZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF04606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF04606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B2KZvUbZ
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49465892f7bso4406964f8f.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:24:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795627478; cv=none;
        d=google.com; s=arc-20260327;
        b=j7tBSXq5yZ9LpCT958JsCsZig8Tlxvvae9Zy9VNcpsXJgDY09KhNhJtczZLtbAHmpC
         BuOUv8DzxXqVhSdlLrbgtKFm4hQisodl/YXLfczJgGF91i65AXWp7x7DJYTqr+wSj4Si
         tvMvkfY/FnxuOdgNefP9rvLTeBrhXuFTNv78aP97zFyElR2MTgSWBQDydjOQfWQwj0y7
         nA1qypPxVa9sbZ0+36knl6QyppArVI4IEbXZ8n5l8w1ZGIz96WnFIPJ+U2R6yj58v1vZ
         Er27FtwtR5n6A3CxlRthdgeO/IHQPGvnFjet1CdXW1X+iCDMVKMSTYgOdyllOd/Rf4h0
         3VkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        fh=8JF1NoQet6pSK1WTEazgo2FVmFL6Rb8vw8xqJoTRIhY=;
        b=X0HYcRafJiqtBBeM7MOYGSp21+zcdIUGxxOkyzyrECbPB549nSa4ousK9vA1h0MwKn
         quIv7CLx/2w3F9IWJN/KMewgjWCBm5uPQSu9brQVsqf2QaOriwQ1TxCZWJTzJfPRwqG5
         kxarG62N/25IeOq5h6AJnOPJvJBUYiwdjLwUqAbYu/hJhjP3KwLBYLekMK0dCErwWgAq
         VCf83WRE4jUcdFmheGKZDPZn5DTP38avDUU2umxm+H07pTxCCML6YMaG7pUUSlEntMXR
         nWUmH9dsBJH9kyS7NLV9V+7hq09g9nbz1Ix7YoTmAZ9zgl23S3Dg9eyHr4QK39rHEpn1
         Kr7w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795627478; x=1796232278; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        b=B2KZvUbZ+CMxUliJWjOFoeTdQTG3TUqjBP1t9Qn4diVvh0xtZSGBR5BjkYOs3ufNaI
         n71V9yZUZtHdNYrQgU3Y+7HRErpuoT9sgHY15lyryjj9qmTD3go7LWzDshQX8Jn2A1pb
         QozTF1r3YF1Clq5rME1tnlxSPbNJt7bXGJbtAOP0KEa64kSIPUmAF6hYP++hHHiIIyVh
         /mT79rVodtFebDpFdULiABiBvbWDYMprw8Bg9qtfgzaaULNke0514z+MA6em49XHiaPE
         T/PxkNFgoh7JMml9KZMB8PjCrl5GIjw151bMvq160ENwveKtRCEMGQuW04NbPxiO3J/t
         XZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627478; x=1796232278;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cF86LuesLCHsWCQn/gQpIwpG2tWZTDsICF+hqaQS40o=;
        b=dqCwa7yLZoceczjUC6ZcTVXiAfH3JuOKkQSoMYaJ2ROp9EkWFW71lhxEZRdX6xYZPD
         1jnLMl3mlWeQ+zaycVtfcBSdtEIBRVjZbLpmOC6EPHbdW4IZacgrbFKLDahkZRr0DBty
         Rol81dMlwLBxG2ztfa4WM/qZXOFEX5s1oJ3vrBNuqqjPT2ULEovIzheOAeRd46LQopWZ
         OnfwjQVU1XxluOULndqFRxKZ6hFyJdYzLN62ykHTTXg5Qj3pj9KebVri8QElN9dXwe5q
         vUhbS5C0DG9WHL6ErncNe1P9xV6/BORs4HMcFFdpy1S1G4AoMue/22iQO44itvM5jWcT
         026Q==
X-Forwarded-Encrypted: i=1; AL+hErEbNB8k6qlSzbZyLlABAnveG4qeGHmS2I2LHs8SuvTS7c6FD2FW9pUEHj5SvihMRYWnzpgQZzY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Cs74aqi2B6lzXSZoSg6lKdrtaX0Li0J24NgugxjkYtiD9D4rn
	uBbn6CYFYI+wHZm+EcvjvAHWBY5Y9NRUJzHDx4HCUYhxvN4B482ZYllbmxUwJL9CHRhYBSrU+hW
	jbG2/AEq91mg62XuuwfOfgBnJSKkrfvg=
X-Gm-Gg: AZFdTZe/lNs+Ooxrd+nxjiUz7mjuRl7DEbdo73Iqkt7cyC4RJPwcsPTyMgRDabU2kBA
	49KGVuz02b8EY5WUma7G/LFs3iZJqc06dI0QmzsAt5N9oSY7NqXT1opA03Lp5OH5ipx1JVNrhvF
	s9QbPKsMWazGl4edEdiYOo6F9gAJL4tWefXfSNPe39p9pj1XFyOlWMpEUiCBW+P7xmEOxwvfqLk
	qDGuC7TwbHivbA7m6s+DuMB0fjUd9w5qOkYjzy2o49JKxXK7IWQMzU/xGmx71aY6arvFEf51GmX
	d91rXSzdN4ENG6IAHpOVMlIaq9YERV/DLWVo/h0QeNEJYK0Kc7YiVzfIYsZJFIOqvRXTDZa0OG2
	A6mLrhOA2kbCvdTCO53jTTwDMNiZnNNSyRC3c5IujONt8gRB5ZdmGt45Rb+qJbGgTNj8=
X-Received: by 2002:a05:6000:4617:b0:487:27f9:840 with SMTP id
 ffacd0b85a97d-4abb59e2898mr35765846f8f.53.1795627477631; Wed, 25 Nov 2026
 09:24:37 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120102754.778283-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261120102754.778283-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Wed, 25 Nov 2026 18:24:26 +0100
X-Gm-Features: Aa3M54oC6LgFaDRKQ0RxvICA2M2DvBKp7vjOEYxTmttrvoHrhd5am24mA8KAZok
Message-ID: <CAKx9m6M389NvuG4HiiRO4Ck45TDgmxwRqRwOHc42OM3Da1YWog@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/2] net: stmmac: dwmac-motorcomm: shutdown
 hook and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: Yao Zi <me@ziyao.cc>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Magnus,

Il giorno ven 20 nov 2026 alle ore 11:28 Magnus Leatti
<magnusleatti@kernelriot.com> ha scritto:

> Giuseppe, your Tested-by was for the v1 design so I couldn't carry it
> over :(. I'm sorry, could you test again?

Done, same Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07, BIOS
Wake on LAN on). This time the module is only Ubuntu's 7.0.0-43
dwmac-motorcomm.c plus your two v2 patches, built out of tree, nothing
else on top. The eFuse on this board is programmed and the address in
use is the eFuse one, so the magic packet went to that address, from
another host on the LAN about 75 s after power-off, on AC:

  v2        wol g   wake, 1 of 1
  distro    wol g   no wake, 1 of 1 (from the v1 round, same kernel
                    and BIOS setting)

This time I also have the shutdown log. With
printk.always_kmsg_dump=Y and efi_pstore, the end of the power-off
reads:

  [467.495243] dwmac-motorcomm 0000:02:00.0 enp2s0: stmmac_dvr_remove:
removing driver
  [467.497124] dwmac-motorcomm 0000:02:00.0 enp2s0: Link is Down
  [467.906480] ACPI: PM: Preparing to enter system sleep state S5
  [468.213535] reboot: Power down

with no warning anywhere in the captured log.

Since the eFuse is programmed here, I can't say anything about the
empty-eFuse case Sashiko raised.

Tested-by: Giuseppe Nespolino <g.nespolino@gmail.com>

As before, I worked through this with an AI assistant; the test runs
and their results are from this machine.

Thanks,
Giuseppe
