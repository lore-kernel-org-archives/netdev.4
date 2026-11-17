Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794882971;
	b=kQMyuNwwCm9zS6a71oBU4oMLerrBJkMQofX+iNq190XPioRxpr9w4KntGHhX3FRNWHTw
	 8+Cb+ZgcXsZrgZiJS+RsNobMZPmCjmG+cOhLqYaHByJc2zRg2UJx39tvBkrmWLn6MRMJj
	 1EzcZhLib5H+4/BO8bN9heijS2EE83OTvlBDbMlaSrrdWtt8ziTFG1tzEDb7a5m/FoMMn
	 f7U4QVy4kqCauECNeVvgDaXbYUrlm7rNKX6clGcAppwuRFkCC9qJUkZQviVSCnRjWTXvl
	 BiOMAks3qy+8i2R/QE1DsDFAVLNlcKCXS22vCpLMgPWQPesM+shkweNwi0HS7EtaSlw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794882971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
	b=dMbhc/FAJmY08qBGoibaSIZPgCsScp4+QFAZiIpxXXsc2YBSmg5mWXvu4aaDoHzi0AP5
	 OS3SE3FrCMIQsW4CNVcISsQKWQCLTTlRHLC8t3EfXOZy+2PbuYf4zKFNc7D7qywxbcysL
	 Pl9C7a6KkoO7FINp2eF4TjJ9hIIbFdRdL4yyAJBUhgYU8bvdmOGqGv3JaRVf84X6amt29
	 GvGGUyW0f5HKColRr/ec41CNKhmJUKO/EYdkESLt6Gp7kXLl65/oWzLtfIa95cmGHBTrx
	 d1y44Xd8k9a1iB5cWC1VWylpnYfdE3IDxPfYrg6WX57e4anuQ8U2OYDXO4NGPcrh87g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfH85jx6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D303606A329
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 02:36:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D303606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfH85jx6
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98301b325c4so966217241.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 18:36:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794882969; cv=none;
        d=google.com; s=arc-20260327;
        b=mclJZ1yG+iaGMfxoAZtcPB84f85S3BJojiHfqfHn8O8jJOhrl2l5oG6peCZbp+uU4/
         dMrauonhjsLeghFIfMI+lrru4GQElVHItEKz4uPQaVYLTA6FKqyLcuAEtGoMeRG1CZhc
         JijHUE1bsDACLmh3az1eBa45zLYfjwPu0JsPJQ4kDMKNvpN9rYF4hUUDTBPL3rf78rVF
         hOQ65yAbnBfULVHpBNeUSMqFqsV6D0OE7t2aFks0EQKMGVdguw9PgggsOrpIJzR202K5
         EFDXsKsbHMOl4Y9/QUSWxcgCmaWeCq2YczatImbOTKvsPkKensZsqN1UqW5/WWgxRHJR
         D23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        fh=sX15lQ/x5fL1AHZnBgqmmoPC5KZFsGofv3c8Km58ViQ=;
        b=YtW9sYsg3cUDbc1BjQrl+C1ZirUJEjjo0wy5V2Nq5wmVK72t7XgP6LsMKEBPFX3gng
         w4Im6J6b79ytPK72WPI3iz8OjfOGrK8gWRNBcnd9OLYm/ZNgwxZKHAcQaydDWiMcI8t2
         RcODxRXsxoszsTOG2uJDP7uM0koaWIsXW0lXMdkaeSoMKHH025eusUM6CN2TENV7ERVs
         15VbU9PDw9H2N3RGaIq+z7ercKBsiq7SGDZ0q7JYfkuppxGcr4KIdWB5WOsfrozP9fDD
         4m8mc0nDfMbEwOh/r4ATNVvgVZ83lGXkvQADhNpKQQIIZCneO943EaZImJa3VvQgvIXO
         BQZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794882969; x=1795487769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        b=sfH85jx6UDOHVe/QfxY8fPLUXzDqrNp76LfpcusrA+iGe+RSnmlNIPSvZZXUmbcjHx
         yxQ0i4ret+BIx+nuJVVHLsbg1P+g/5xFbZpBqVR7V9pi4sVIAS7HAzJdwEYvwvR+VRX/
         HFINyp2Yl67AgenwoscipuqoUUGq8iUd/0mEbxT8zfEg9UTAviXlt7Ioj3JA2wufDaoj
         o+GP6/uT1/yc/3yn+w9UG2Z8MFYaYNFhn1hV+/Ju828W4K/DoX8Zr4AoyFW5KGYRRW/p
         S+qqZVzJDJrbP0FB+BFUHa9WN9+mEX35WBBpUVBXfST+p0DTDfWODiesu1wl+rAcrw1g
         2HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794882969; x=1795487769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P7WYFYjupt1wh2sDDV74CfGFKi15+W2RgoXEiZ717ZY=;
        b=GFC3wpysTFE8Fr16Ues2urQWsbyXPJ825Fv8X8oWqcrvcqiZkT1g5V8vixblH0GQzk
         IsvXeeGgWyNlvN/m8hyvoih88alw0XoeUt1uVt0kqJQmppVbZOj0TzziDgMSgDYtus/p
         oJoxCdHuSmgCQ2pD8xgs/5CS5nwBMSayTyc1+l8HYrd6bjvBRaFpIXcnQ4x2mKC3ekaz
         nbtYwqyAcoQtC5VHZKh86ORAQfqIy9nDEoiOLJ8TxykyrtdiDWxIy9SVF3rfGXKZD1ck
         9MKf7Aw3XTXbmcYTnOYOWGgCAgj36KK6e0AgICUGm+6ngi4jLtTEK9HhULmgr15IiNK7
         U5yw==
X-Forwarded-Encrypted: i=1; AL+hErHW/wnGqDLCt3pUQqHdS9XjG5q9wcydwv4xu3biCCZVUDSqek6GVljLkByUfwuczRiipSR32fE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+fX20AZljsL793kjNXfGhwZLMHzp7pUBd+5xnessTmGrT+ybVv
	AXXw032Njyms+i2y2pLVmM0G+9oPGCwSNKPcr+67sGpssuIrl/QKtIxvU2u1mNSjvw/66ntHHUh
	UCOExRh8fFFRXgrrdn5NManYW7Z1/Zqo=
X-Gm-Gg: AYBFou1cPGCVbXZGJGSGdh//Yl5kjU2EIFBWuiTqrCpbja51bwckHiT+Kea5aCdjSpQ
	A9a0e5easkV93UpneZiY28EluntOJIJ8y2q2xYFXTKgZKn3aoDW2QfhoOrbBhXTwxA+8J8D6hcT
	yluEUlz8CKTGZJGz7CiKJS8t8kVXE+cwSWJPA12BKkV+M5YLjUBttOcrCXemnjEeVVDnUQodQ7f
	OPAhV73aVFO4wkpy03AaWfP/crIGLUZMMETB8jZQgUYsf0vjJKcIMXfavbVlMhzMHb8lJc+Mz3N
	q/fZDtdUDCNisv1pCAAkAn+gvn+B6XnGNB9hmqkEATSXZf6ChOH/5pZhfS8pmKv12NJhAb3Mj2q
	LVDNz/N38JyFZuvGQd8GHU85sOokxio+p6F6tpW3uj32lykkivV0ZUzgzMuPAkAJGkwl3l2VQQP
	EZ/FWEvVPzhYAxNkuwkSPJ4kKh79Z8TMLm+FlCn1Z8SMDODyXfXDs7P3k4fnVLKVhWwDKcTvquv
	tWnQEzFVLQAhSFbfVMJZXzlqVRHjg==
X-Received: by 2002:a05:6102:50a9:b0:7cc:2c29:54ef with SMTP id
 ada2fe7eead31-7d64d6f7105mr3309563137.19.1794882969366; Mon, 16 Nov 2026
 18:36:09 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-submit-acx00-phy-stats-v1-v6-0-8feef8e76cd5@gmail.com>
 <20261116-submit-acx00-phy-stats-v1-v6-2-8feef8e76cd5@gmail.com> <avsBVtVgsluPNpVY@pengutronix.de>
In-Reply-To: <avsBVtVgsluPNpVY@pengutronix.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 16 Nov 2026 19:35:57 -0700
X-Gm-Features: Aa3M54pBz4tT0t7JeZwLsOLmzXp6qqOvkWqH1XF1WpTw3kHr4oh-FwmKwJHq6L0
Message-ID: <CADvTj4qMgKrRZ_uq3K4t2+w_3eai4dwuCPod_vhEKEOsO85_Wg@mail.gmail.com>
Subject: Re: [PATCH net-next v6 2/3] ethtool: include errored frames in PHY
 receive byte counts
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 16, 2026 at 6:12=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Mon, Nov 16, 2026 at 01:59:58AM -0700, James Hilliard wrote:
> > Some PHYs count bytes in all received frames, including frames with
> > errors. A successful-byte count cannot be derived by subtracting a fram=
e
> > error count because the lengths of damaged frames are not available
> > separately.
> >
> > No in-tree PHY driver currently reports rx_bytes. Define this existing
> > counter to include bytes in frames with errors so drivers can report
> > their hardware byte count through it.
>
> I do not think we should change rx_bytes.
>
> Comparing PHY and MAC counters, for example to find frames lost between
> PHY and MAC, only works if both count the same kind of frames.

I did some additional tests to understand where the observed differences
come from. With MAC error and runt forwarding enabled, a bad-FCS
63-byte frame increments the PHY packet, byte and error counters, but
produces no MAC RX descriptor. At 64 bytes, it also produces a MAC
descriptor reporting a CRC error. These lengths include the FCS.

MAC-internal loopback reproduces exactly the same 63/64-byte boundary,
with PHY loopback disabled and all PHY counters unchanged. Good-FCS
frames pass at both sizes. This shows that the MAC alone can produce
the observed filtering; the earlier results do not establish a
CRC-dependent runt filter in the PHY.

It also explains how the PHY error counter can advance without a
corresponding MAC software error count: the MAC can discard the frame
before providing a descriptor. That difference alone does not indicate
a fault between the PHY and MAC.

> rx_packets counts good frames only ("Total successfully received
> frames"), and so do the 802.3 MAC counters aFramesReceivedOK and
> aOctetsReceivedOK (30.3.1.1.5, 30.3.1.1.14). With this patch, rx_bytes
> would also count bad frames, so two counters in the same group describe
> different frames. A PHY without a CRC checker cannot fill either of
> them. A PHY that has one, like ACx00, should keep them consistent.

The original implementation reported the inclusive hardware packet and
byte totals together. I changed rx_packets to subtract the error count
after review of the successful-frame definition. The hardware does not
provide a corresponding errored-byte count, which created this mismatch.

Subtracting the error count also does not necessarily produce the MAC's
successful-frame count. Valid-FCS runts and frames with an incorrect
802.3 length field were counted without PHY errors, even when the MAC
discarded them or reported a length error.

> A separate counter for bad frames, as in v5, does not solve this either,
> because "bad frame" is not one thing. 802.3 counts symbol errors at the
> PHY (30.3.2.1.5) and FCS, alignment, length and frame-too-long errors at
> the MAC (30.3.1.1.6, .7, .23 to .25). A symbol error points at this
> link. A frame with a bad CRC can also come from the link partner.
> rx_errors already means different things: mxl-gpy reports its RXERR
> counter, qcom-phy-lib and dp83tg720 report CRC errors.

The v5 addition was an inclusive byte total, rather than a separate
bad-frame counter. Its purpose was to expose the hardware byte count
without having to infer how many bytes belonged to errored frames.

The ACx00 tests confirm that deliberately transmitting bad FCS from the
link partner increments the PHY error counter. That does not imply a
physical-link fault. Tested valid-FCS runts and length-field mismatches
did not increment it, even when the MAC rejected those frames or
reported a length error.

I have not isolated symbol or non-octet alignment errors, so these
results do not establish that FCS errors are the only events counted.
The proposed metadata could express those distinctions without treating
every driver's rx_errors as the same error class.

> Strict definitions would need a counter for each combination, "include
> everything" would make the counters useless for diagnosis, and moving a
> counter between fields breaks existing users. Also, few people have the
> hardware to confirm what a counter really counts.
>
> I suggest metadata for the existing counters instead, similar to how
> ETHTOOL_MSG_MSE_GET reports the scale of its values next to them. Old
> user space can ignore it, new user space can use it, and it lists only
> what is confirmed for a PHY. Andrew should agree to this direction
> first.

The tests confirm that the PHY counts bad-FCS frames and their bytes,
including FCS, and increments its error counter for them. They do not
establish whether that error counter also includes symbol errors.

Should we return to reporting the inclusive packet and byte totals
together, with those confirmed semantics described through the proposed
metadata, rather than deriving a successful-packet count that still
does not match the MAC's acceptance criteria?

> For this series: keep rx_bytes as it is, report rx_packets and rx_errors
> as you do, and keep the byte total driver-private for now.
>
> @Andrew?
>
> Oleksij
