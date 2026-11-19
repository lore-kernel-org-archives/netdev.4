Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795073010;
	b=faRmMz4pQqsVB6dlYI8KwBJfeW5vRvyiG2uXNZuvWVdVvPADlZ9xfvRBw0m0aQzgsOFf
	 lKRDYLbkfZroUUyYrmZORpDtfyJhBuJRhKMSPMqOcJbqzoc77kzS7YXzCHX14KccRb18M
	 8Te/t56YVvvAxZhv2zOcRTWwz92gIsoH/hH2KKdaaydLxsgCTF+XTzZsfwZVvKUVv3fxX
	 ypa+wNlYyqReLAqxAMw26yU0KCKY5sdtc3cKYazxj4qLMFi29cEmZHRaArLSnvBLVhhvy
	 AzZr5u6nEHApMHZF1KvOAOhSKVJAhTlPvYxu8QQs5dGZQJ8YvZrdzXDdm12scPkNO0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073010;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=5/VhkuCA8ZAd7uZZ41bzxqD4ze88iMwlnf3Zq/aoup4=;
	b=OGkJ9RSkFJ+Tg/s7vZFFZZuDpaMpSG9QjtmQcopf41CcLVaesW/EbqKEZmPhb2GFS7w8
	 zDtFzhGYtmhAULz5TjXDEKDtDUxA4pfc73z8b6Vu9o3rLIJc+hy2gS9zx4sLGJxWdN0rx
	 JRvc7LjkuZqbg9j2z1As3PevEUAhsYXTtuSGZs1bkR1am2giJEvGZHsPJF8spdyK/qTZy
	 P86cQIulK8wMWLIe8reOd145sIoJNs2dxlewA5c3VCPQr5nPn7uROsjvwhh3fn9aST/96
	 dx2wRz0FD+WuscCdjnDZfaioTEkLwns8fuxSdiXukS3V84hZexhuPMbWR7sBe3W7tvQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EDmhu+75;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7EA606A324;
	Thu, 19 Nov 2026 07:23:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E7EA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EDmhu+75
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BF89E201EDB;
	Thu, 19 Nov 2026 08:23:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795073007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/VhkuCA8ZAd7uZZ41bzxqD4ze88iMwlnf3Zq/aoup4=;
	b=EDmhu+75x5cecWtdOPcWnjsG6gytQO84E8W8zM56wp/tp6SIVziQqdoz2ts+liD+JI07li
	4Eb/J191TuHeuqyH54YD3Mce4Wm8upKtUgid+Rk/t90nFyh4gXSRnqFVY7seNSsxbOGZHg
	zpmfi6oCZrrBXTu/jhWMPFktd5Zz99fRgpr3aGYELpfdAi5t5qHBaq5CZ6MVj5YirQ4DXW
	DcO+lyku1TvsHb9wlYjeplED1a/Elp/7tkZfxtsVYtmLmdMnA82jM4uwIabJYeqIuiL7Vo
	EYRfn3ClfG09h8pp7wUOg+dPuzNg/V319ISFCetJo/L3I8Vb7UNlkQ5veLxheA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795073007;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5/VhkuCA8ZAd7uZZ41bzxqD4ze88iMwlnf3Zq/aoup4=;
	b=MSxw6PvrJqkRIQXR/JxQfgIMe6df99vlbbUWdLFaEr0cQCQQer13ihYI6IoxlZ3jKZBeym
	iKjNB08QpaK2Ox9xqUT+pF0MhQczSZ9luBrxLvijqXiCM0yyw0vSm2Fa0EorU17ucbTrf2
	PBlqaRt6R2DMhvvHgIrRKRZfnBJVxfe9rTsNsMoIHeOFmdZKdpKuk+PXjmezqvIhi1ZxVI
	eyT06q8t0k3OwL053svcnV0QFGGzyltUVMyQ2XG6scf2FrCqOTMqLYcoDDfmLtVNJYCA7f
	Wgoe6JW2kbKe1e8i0YGeJtiLsh+JmW8Sjb1EvSAPkLE6jLZM+Q1NwzybWDHrvg==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795073007; a=rsa-sha256;
	cv=none;
	b=eVojtjF0LVjKG6hEq8QfRRWnwMUyVXUGux9Zz+z/cUi4rWifI0nCV+JjWBDvh9p5BiQMdI
	njUvnHbMSeftuwXG2gztp5eDB1gI/JWy1nKshD5YenmGRSYBrBtvHt8M3cdlQeU8Sn9E8S
	l8vBeZWD1TFnKYg+HeotodoYl5w07+jkKRlKzSRjp38whsToLfdb6Y1JyiavZVZkgZ9zDa
	Xs9E2b7m6jlMRtGxq932XD6+MEL2b5Z6lU6tzJY1uUv1oMkfcj1XqpcgM25zPyRwzmUEsv
	7vF1Vx/OGDguqzWA0oYK5lZeStnfFM1qjauHjLmOkyiqZuqBJWFUBWAzysrYmg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id AA8EF1BFA16; Thu, 19 Nov 2026 08:23:27 +0100 (CET)
Date: Thu, 19 Nov 2026 08:23:27 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: woojung.huh@microchip.com, UNGLinuxDriver@microchip.com, andrew@lunn.ch,
	olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	arun.ramadoss@microchip.com, jiri@resnulli.us, linusw@kernel.org,
	f.fainelli@gmail.com, vivien.didelot@gmail.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de, jensemil.schulzostergaard@microchip.com
Subject: Re: [PATCH net-next v3 3/3] net: dsa: forget the port ageing time
 when the port leaves the bridge
Message-ID: <av6j73ghnlzgudsz@pengutronix.de>
References: <20261117-ksz-stp-ageing-v3-3-135de6b9f8ad@pengutronix.de>
 <179505020217.3136.6917391809574658393@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <179505020217.3136.6917391809574658393@kernel.org>

On Thu, Nov 19, 2026 at 01:03:22AM +0000, netdev-bot+sashiko@kernel.org wrote:
> Can the switch still stay at the departed port's short ageing time after
> this change?

Yes. The v3 cover letter lists this case as not fixed: "The last port
of one bridge leaves the switch while another bridge stays on it."

In my reply to v2 I wrote that v3 would add a patch for this case. I
dropped it, and the v3 changelog should have said so. That patch
reprogrammed the switch when a port left. It did not cover the case
where the last bridged port of the switch leaves.

This patch only drops a cached value and writes nothing to the switch.
The dropped patch added a write to the switch, and with patch 1
sometimes a flush, to every port leave. That is new behaviour for
every driver with .set_ageing_time(). I want such a change reviewed on
its own, not in this series of fixes.

This patch does not make the case worse:

- Before this patch, DSA kept the ageing time of a port that left
  until the port joined a bridge again. Every later update included
  that stale value in the minimum. So the switch got the short ageing
  time again at each update.
- With this patch, DSA forgets that value. The switch keeps the short
  value until DSA computes the ageing time again. That happens when a
  port of this DSA tree joins a bridge, or when a bridge with a port of
  this tree sets its ageing time. If neither happens, the switch stays
  at the short value.

> The existing comment just above the new code says there is "no good
> reason (or value) to change it to".

Yes, that comment is out of date. After this patch there is a value to
use when another port of the switch is still bridged: the minimum of
the remaining cached values. I still do not reprogram the switch on
leave in this series, for the reason above.

Oleksij
