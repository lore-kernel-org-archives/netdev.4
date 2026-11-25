Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567865;
	b=Sz3bsMkyXyoopBlCX5k2g98uUzpeUQkHUcMBan6dGfJoeTiWH836To21orIVATGJZ7lU
	 NxkHg/Vbb0XoApm07hK3xALJiJL7Mr7bkOCbxSo1xemU9Jva/6C+mdg9yIftrUjw53VgT
	 woesoeM1iQtDdYRnWyBUcL05MpXrS6GHrSqwNAyv9aN1NPpKBfkNwTKkGT5rwnnU0CIb8
	 DttFXtb5siU7W4jAhXoBLfjqNs26W7puefvCRrdf41SXi4eu0vX4B/yqB2fIRSdK6IPbJ
	 tPE0sh1omgBONMfD2Lf12dbnnHEdNgpCGfHGhmj0B6EgSNHrxJ5Ac1XwEFddAgMoGWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PpR5jUCAskrT0jubsw/0Cv5TPLZC4Nx0puV4ZgZlLLg=;
	b=IlhMaUP5aiz3nqYGurlxgA06Dv361gk2/1bAudAJuT3JFdsK18+HTOsI4fnzoKECV2Uz
	 imlpQ5wX9DGKyw14KPjxsm0YTMqQPxkzgrlHhfTWPk6bCbuPVGJnkvdygpVjt4r9vW3/C
	 7hB1N7dZlSOWLsEQZuh5PQISHYXq00GKlcGh7a5yjMOz+/zaeM65ywpBhL+rAPJ//FCW4
	 hqe/Tjhv0RGHTA5JJcVqqp4wtegVpzCud9dbZJKg0NFbrFxzkGhOKMpNRFYwRxKH+qyIL
	 MGxH3DulTUjozpk4Q6hVFsMLuaN4qNKFCnpyV0+irrIIJjamwKQg5aApYNJFE6t0DzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q+mAE7yj;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A450E606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 00:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A450E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q+mAE7yj
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso3597446b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 16:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795567864; x=1796172664; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PpR5jUCAskrT0jubsw/0Cv5TPLZC4Nx0puV4ZgZlLLg=;
        b=Q+mAE7yjlBt5TSyl2OL0GzkneDvtCp7E7kr5fKjjMx+7g+0VJDFTt4TGR3Wlbm9tgw
         sY0Ksa3AlpYyqW4PzD4dbZghggpkpFp+58E7DSe9CY1ZYAI51YIFNxAIdTYoF2lSkDrk
         rGiebtwIBNebOi8veX9/VlkzeJm/VVfo0bslLBhvaJ+83wkihQ1fkcxge9WEEAiQ40bM
         3FnaPYS80RCQRNV0ly4Wljl+YzmSFUmrJ99D3bmHZ4gZJeDFa21dyIYNDPmaRuvxxMrP
         uSBTG8hXd86zyvMGIvINz4ZEwa9zXJy5p+FjSHeBkI+C3RIh68wzBdHEf+KsSLdVhEEG
         ub3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795567864; x=1796172664;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpR5jUCAskrT0jubsw/0Cv5TPLZC4Nx0puV4ZgZlLLg=;
        b=tP3n37BzvCDARidpebBRd7WHcCTioasQ4at7w8bPoDveWEY7i8jY5ZEqWBwGePwkS/
         XgefO0wjDQ3dQqq3dfGkiCcXy3xrstF+swX0IaKM9si3LwlTJtA7zicbJaTFkbhuVZ9I
         9PDRO39F5Ej8IGXv4AQ1FoNk600NxDf9dhRguOGz5UGyO0aZECuzSm9WYYabdb3v9PVW
         N9kVhlzS8uhFndbydcKUwk44Gf50tsADuwvAwvJMV6YEg8qmIKw4ncEep91BkksO4iS/
         uocjMhcwTck1ugCKO7bS3E1Q6d7J8Ll8fsOjaIJj5ldeuLSlYbPzJ7tnA5Pv3R5zHqEn
         +Ohw==
X-Gm-Message-State: APuU4Z8QAWyPTvL/RC9xHg41O4p4P3+JhkFAaUpSp/E/tYEumhtVe+Ln
	wkdrEwnk7B6ToebC7eLJD5fATbtyFbRMK1/pbFkYCrE2vbTMrS3DuurLZnh8qEmoeQ8=
X-Gm-Gg: AZFdTZeyhDiMS5akJ6lp/44pWvMaSj8iW57x8i2S4dE9X7PCI0qfELczsZmfiXa9rt3
	TjMHXBQje5/40ZkrZrFp2ZDAozWXAxDX5O3D2QyKYPjvDQq9ZVdyHJXp9+gCYT18mS51RlZpvJ4
	GTEw5+R3eU6fLMkkZ9cl5yBy2cNj0P5O2Psww9aRzkEYOV6pzkksWjWd6Q0EZrFe9CB834vIUtX
	VGfOjfSXxejy0TFKq9iT0NP2QVPPOoT0RkdHP/Y8pkuG60v01Os3En1yokSwE6nZVVvgpXFEmhU
	Vz/T57aireKJEMEdugdXwh0G4ak0F6hb92jxxYlqe6jy5bOig46MjWtLKI2I6CCUNlnNBO00IqT
	CloSFCSsuUJGXIiW/2t+k5SNimGqcnJEVZ9UFnXdpyNGJ4xQYD+sND6OlSgNTAEV7Jf6PHG8QlX
	Ve9NJ5iT6DdsI6A/C9GipFYkIpJQNYiBfdUzCoYaIW5/TekvCqBcxnqOTpbuPNrO2XxUJuaGMpu
	bHdX37c/Rg+iIrCdGU+9VKYTo5BWNVAR0enZe3uXNL6SaLNJFh417B6h4EQR6i5Awyt+/I7vmk6
	5pfyaRcg5urpN50PXVC3M19mKk2/5sUcKthjp1CxGnmzLrT6phhv+UyBYDa4k50ebKy6KYyO6TW
	cVWjjbSRlmGovm9aK
X-Received: by 2002:a05:6a20:734f:b0:3e2:6f90:b54c with SMTP id adf61e73a8af0-4014c350660mr17509363637.47.1795567863795;
        Tue, 24 Nov 2026 16:51:03 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87285ccf4sm7610485b3a.12.2026.11.24.16.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 16:51:03 -0800 (PST)
Date: Tue, 24 Nov 2026 16:51:02 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Dave Seddon <dave.seddon.ca@gmail.com>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>
Subject: Re: [PATCH iproute2] rt_names: do not write past the end of the
 name tables
Message-ID: <20261124165102.796fbc49@phoenix.local>
In-Reply-To: <20261124055549.3390238-1-dave.seddon.ca@gmail.com>
References: <20261124055549.3390238-1-dave.seddon.ca@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 23 Nov 2026 21:55:49 -0800
Dave Seddon <dave.seddon.ca@gmail.com> wrote:

> rtnl_tab_initialize() accepts id == size, so an id of 256 in rt_protos,
> rt_scopes, rt_realms, rt_dsfield or rt_addrprotos writes one entry past
> the 256-entry table. Use >=.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Dave Seddon <dave.seddon.ca@gmail.com>
> ---

Iproute2 follows kernel conventions
and the kernel maintainers decided to drop use of Assisted-by.
