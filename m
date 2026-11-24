Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795560757;
	b=vohd6IYHGPozQ3f2AdRaA7h2H5xW4jnIYHOzu3rXBk1Zu7HgwMxmca/H/CipUeQyk0f5
	 4y4JQ/wno6vdRI6aKTEHADHb903cdu1pnwi9KamA7c1BRmT2YfGvpy3wk7OzVv4nunBoi
	 hErXsI8mmTEIgT57AHDp+2u1FWyjGRX/fQH1FKn8PMWlEIRdqUk2Md9r2AAcoOgj5N0WL
	 35heKg9HuJYZbiozfcpcPpPSufmXnc2m0NuIxnOUDvmvHEk+jeDOxuJizIGdXMtlT5n0d
	 Xfux6b39cpBaHBAMM39Luk97uP0FKj1eK3KmqMvRH3gB4BuEqUZPP5gQPL+CMEhB4xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795560757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=d52ekL4JyploodHs26XyXsmMo5Yf6ra0G9J5NMtAS6w=;
	b=PG/ceg7m+J/cS8iqYnE3piiDKsOhn5ib2iu0akPVbIWXEeQueAC3aluriXswJ+4CVmDv
	 +GndDME7emCR6BTlwxgy1RUVTkSRR+kBYI56dn4VpjjyMRGZcwYNxJJSOlQMMan/hdv2s
	 xDZoEkswmcLljPXWeiD2VhR8wWg6D+vpn67CbTKV2s0p2+UA5795yipJfC6o8pSb+eRPW
	 f+2KcbHKQ+3XDYBDKnh+yF5+KFqOe+WjPZQb+jqQ2jy+1gnjndgwpcFt9+6GAwWtE1IaU
	 I5qP8dOrkDnk2uOBJwT6fsLPX0n8GEa5S8x+tkTQFkulSEFwsYa5yR7WHBPHBizxnqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEsMTOt5;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6F4606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 22:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E6F4606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEsMTOt5
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-38431138772so6545699eec.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795560756; x=1796165556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d52ekL4JyploodHs26XyXsmMo5Yf6ra0G9J5NMtAS6w=;
        b=TEsMTOt5wJcln9/RbYz/crgvoGE/mNwB9K/TBW39UuTyA+oncLT7ovJgo7cRWmCvsv
         UTVW5qahn5jebC8epsX0zMxo5UAXG05ZdXKJOL/0b7zS0sQyP2Q96bWhBi+EBz9Ec3YZ
         05iyh4Y9Z4I9nMPyOy5Yyn5g+C6gcuxfYHDGbTlLZW+/m0Y/5KY+X9oJXCVwRCyVqgOB
         oWOC9KpeoeXEmkKD4QJrJdlzpa+UE1bbhs0TbXbyRPUy+iySr61I2TsjZdRsnvWk57As
         uEDY4w9T5eDPdQUNxg3qDD/IoQpF6SsvBXFEZZhlwqykSWUcpg8mfPqRVuQcgT1CqfJi
         jDUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795560756; x=1796165556;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d52ekL4JyploodHs26XyXsmMo5Yf6ra0G9J5NMtAS6w=;
        b=IdVxVU19QQ9w4YDDdrsMWzSjRRPV+W0MUP1WS8S7b28YHJPYZ0Z1UKG9vz8Nj5IRBp
         qYkpLeyPNpTTxa5WVyaZBnY6AO4vyqGVdge+zfTMdNJLYR0JygSIia1N2OpZUEak2de1
         DvOj/7PGMHRVIrsruNu/5Njz8p9r+mQ1uc+0FesM83bJRBEpefrQbGQ9zVSymHK0oJu3
         7i6GKOlfCt9C6NAk+E3PvTN/QtLGX7lHqYdku3aVB1BXd38JgE+1QhEvTbgMtMqIR7sH
         K0WSkYN7Tjehyr+ndbg5B8R2zgbxzh0jVlCYd268ujwOhqK/u+eyORAs8x5SnoY1bDkN
         jR3Q==
X-Forwarded-Encrypted: i=1; AL+hErEBpceDhYFPDlzSGFdK/DqeZ9TdAMr4AlfR1spnKTaNHs1ucLC7ZNZsp5ybbpjwRLY9Zkwvaz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kiqzPywdtT2OVpBGXF0N8RNFoyMf3jJzUJEh8ED6WZbkv+7Bd
	q5veshvlULR49qBbbieeUNE0jSBRD48HzDJmJCcxCRtVNFUxqreQNis3ezpOJzm2
X-Gm-Gg: AZFdTZfRzK67TifHsoNk3lQlR5vlx6FV65QuSDVbqhhesXZYsqA1dqiQk1tXVZD7lKW
	s6CkLArd3AueZJEu5L1CaEjPTIirj41r1UqKLczPfnaMwc0bC7ETIGeU8WdJQpwzSI8MbH82tv8
	j8jVjY7ydzfs6gQkDN4izLGMNlEB8sbHMPkONwZFpL1GGaoGpWPdRljgWl6oD32m9aHMUQSdaWA
	S8UeoMogTLzZJz71fLVOIRRUbXN6fhZUNeRYXK77AZQ89dsBhKMF/LHDbilGH27WKWGe0tbxVNN
	+OwwHcm5eX1ViYrImbpeWAdrbAPJv7lIWK5uZvWxTrZ0LcFCsQRrvy+91f1zDK8GD2W5sp0gek1
	IIbVRWR9I9P2rvs8Pai9L+b1XxoU+IRQvK1nmaML+msQj8Y06iUVMdeuv2Ba8rRbcP/r/D8iq3t
	ttRxx40vmYBLnMd1jgMY+6BBX67m/lpFOZNefyfn/j2hBj+0z2sg7RnzSadCOSTNDNlBU27NYsy
	zvOyq4AT9TXafq8osyYPO5msrBXI41OAJswO2VUXR9IrZq66jqtK3O1Au7ObBYLJngi8aQed9rs
	N3o1Ma+QqWTfbkLS5m13xYmCGL6VLhUlwu91maG3uAUj0GHg/4QFj6kirSmRNMO/457Dz6LFhJ8
	JI7SLBx/Slmx/QtMPZdw8tSOW3id3e4em6rDKFhq6RjU8s5Dkt3BW3wCGrvbqfujGyElJRhAh
X-Received: by 2002:a05:7301:26:b0:37f:d740:51d7 with SMTP id 5a478bee46e88-38571b1308dmr17025020eec.41.1795560756059;
        Tue, 24 Nov 2026 14:52:36 -0800 (PST)
Received: from Mac.localdomain (198-27-228-154.fiber.dynamic.sonic.net. [198.27.228.154])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm58306907eec.11.2026.11.24.14.52.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 14:52:35 -0800 (PST)
From: Ahmad Byagowi <ahmadexp@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,
	arkadiusz.kubalewski@intel.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	jiri@resnulli.us,
	kuba@kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	richardcochran@gmail.com,
	rmk+kernel@armlinux.org.uk,
	vadim.fedorenko@linux.dev,
	vladimir.oltean@nxp.com
Subject: Re: [PATCH net v3 2/4] ptp: ocp: use hardware selectors in DPLL frequency operations
Date: Tue, 24 Nov 2026 14:52:33 -0800
Message-ID: <20261124-timecard-common-v5-tests-r2-ahmadexp@gmail.com>
In-Reply-To: <179555822538.3135.15182959488825985221@kernel.org>
References: <20261120-timecard-common-v3-33316bf475-2-ahmadexp@gmail.com> <179555822538.3135.15182959488825985221@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you. This is a valid gap in v3's mask-only correction.

> Does this mask fix the get/dump failure on adva_x1 after a DPLL direction
> change to input?

> On fb and adva, 0 matches the "10Mhz" entry. The adva_x1 input table has
> no 0x0000 entry:

> ptp_ocp_dpll_direction_set() clears sma->disabled, so the disabled-state
> substitution added later does not trigger here. The adva_x1 input table
> is unchanged at the end of the series.

Agreed: the disabled flag alone does not address the direction-change
case. V5 patch 4 handles input selector combinations instead of failing
every non-exact lookup. An X1 zero input selector reports 0 Hz (no known
frequency), which permits the DPLL core's get-before-set path to proceed.
It does not invent a 10 MHz X1 route or change the selector table. Output
selectors still require exact matches.

The published x1-direction test executes the actual direction callback
for all four pins: raw 0x8000, disabled=false, a successful 0 Hz read,
then successful PPS recovery through the actual DPLL get-before-set
function. The boundary test passes immediately after v5 patch 4, before
patches 5 and 6. This is not an additional fix attributed to patch 6.

The ASan/UBSan routing tests also pass 4,669 FB/ADVA/X1 input masks,
including combined destinations, conflicting frequencies, unknown bits
and strict output lookup. These are source-derived tests with stubbed
MMIO, not observations on physical ADVA X1 hardware.

Public test fixtures, reproduction instructions and logs:
https://github.com/Time-Appliances-Project/Time-Card/tree/c889b25e9ea175f64dd811457f8f2c3d29512e45/DRV/Linux/tests/common-v5
See tests/run-routing-tests.py (x1-direction), tests/run-boundary-tests.py,
results/original/fixed-x1.log and results/original/boundary-tests.log.
The published runners and negative variants were rerun before publication.

V5 series:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com
Patch 4, hardware selectors and combined DPLL input routes:
https://lore.kernel.org/r/20261123-timecard-common-v5-d669cfa034-4-ahmadexp@gmail.com

Ahmad
