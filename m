Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795264113;
	b=4crA7YD6he15yRpaz4714B/fifG3UhUdqu0V9iax9yTVHJyVAIpJGyVV+/fYdR7KmMH1
	 BjMWZSQ1sWU9ycK5LTc9ZLbF+0pephrGPj7NVZp1u5YBELLhq91H5FzYsb2i0sid4ygrh
	 qDpaAUAfJ1JERdRC045TU9jF1YoHfMHkpwn9EXalWgzfnMiA47dGp7XllFpSS9RpjQw+S
	 E7na9xC8IEQ7g2DSZj7i1+pcPnUPCFqsne9Fwjqx+/ynTYLcJ2694MrmEf7juzul+mAol
	 6nfiWcLPMhWqJXK254nZCT4byvHQ3LvT1EncDrqpn0ZhYTPvQB80gTxWf2hU0ozmv9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795264113;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rFdayxRtJl/NSoob2VtOJz54UfnrykTn3RP7oeZONZ0=;
	b=xgYuVzbn0BhqyrB+ry2dl47Q1E/TQZ6irKv8DBR7e9Y90w7Jkvvupn1GwkBgxO2wtLgf
	 Lo2WwqWzaIjqeTnOmpGSxB3lDxKOd8qO8KxD6fA6L0kaYn7xnaJ9GzDV06ADMxOyz9qxI
	 EEmkfOdCozWlRsxZVKEo+R9zU+nyz2DFRwQ5azbdnuGxJMllCaOQg8eRQGWwUI7wWLQ3f
	 JSYoiTCyxo7ICn9USAGhzjVKDjIRYubx2gvzlkiu64NpACVlsa+Z9IbM9zRRrNAaKYe3D
	 JbjluOYFjerZtKWxK0lvRGJjVyvSjhtDincihwdT7R4a0PMSTnHhHSmXyoGTl+9tsew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POtic4UK;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E6E606A320
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 12:28:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35E6E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=POtic4UK
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3845065eec.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 04:28:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795264112; x=1795868912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFdayxRtJl/NSoob2VtOJz54UfnrykTn3RP7oeZONZ0=;
        b=POtic4UKlRWck6bMKXB4dPlX62Zqdy04A10cDjVNVvW1kXXnIRPpMdK5egZ2FxEWoU
         Agp1GAhGEGLcqpsjmSemUp3j41GKISZhwukkNNp6/GBvlnfCaL0Ay9JWuvPwOChXohIC
         ZVrK8sNir0ES/79YmuLRMjk8Qs4LENsEcuuEQM+TWp+bxdIxSlO2NFEexbZ598RSvbi+
         26O2KmqJ2G8yywcKpHT1jeUak43YxxstMLVLZTBQJ/DqYUKawpd19HQWwDXoCsWSem8K
         BYqwzj0G+BKWnw6VU+wqjUneIdVCuWU4LZ1LPPwvBa+q01CsTAjevnJyvFMXS0hNXvQZ
         v6VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795264112; x=1795868912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFdayxRtJl/NSoob2VtOJz54UfnrykTn3RP7oeZONZ0=;
        b=aaCrjP587T07YXXgCEdDwxls3/S7QRzWqPi2RnBzzOBdj+p02SsPLIlMrplzyek4R3
         OIVhLkrv8s/9yqzHkcyo71eoQIqAYi2woXTnMut44qbXPKTauIuBzAOdJBfd6oGU9uJj
         VkeAYDcqxAcEBb7BIx7UEZ2JjSldpjd/lUhQkuDJ1YLDyYrd/rfryOaE4NPNnnW/+G3y
         0ZlYE14mXhBKArrj1Wafl4t7H9XZqLAkyHTxEJDIOM9MdpR8TlbJPIc5Yg6jUeBe7mOp
         DnB7FM+jYCKFj5L6U8kKiD7yYTS3RoYMHQyzpE+aNy7yvvtnzYIuzPY0OSF1c14W4uFD
         2GsQ==
X-Forwarded-Encrypted: i=1; AL+hErF/y5bfDIM2Y4ydU7DUlOAIjvugvWi4oY9HaaXBCpHk4Q7HVRLsQEGJeerZQPj5s53r+4ZPDuw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rh2ohLg/eobJ7Cq7nj+mklgWXMllioIT4iN8UUj59L8PPWvBI
	1aaJQ1U5DLN6Hf1ZlXjkSUZm2wPqCpvjGlly445+7yoH80Sm2ju37bYz
X-Gm-Gg: AZFdTZdWiLvJ8pAUMiJZZMtzAknw9G4EPm/xRDzl4RibrRU7Za5/3ub8gONW2TqGDRy
	OmdSgPXwYCq+LCQtZfolscCh5ejGDikcqVcSwiHPmnTIcZhAhYD2nP+eOALnxBiTuH+9RCQRIK2
	fff5MQ/vsfDUyG0B/2FNzXhK1euGaSLf9wg8aYdvFAvPSTt8LOuF1UyGP3v68+XNm0JCL8R59VC
	Luxok2tAMemsUufFiNVMWXthsyg0jwCw7Ot/3NnqVNIyYyUH+3n2AOy7QMY7dtF66QeTLDHIl8h
	cLUUWlSnyPDpddQQ9i22UkBW7H85IlL3pgiGC+tRq/yFOxHKTndM6b8kgsrO0IegVyNNQdh1c78
	wKvSDOMNh7t8CBxOIN0qMvRMsMzZRJ74j5CyTWO6q/8JBNJCtN4J/T7uJIKThiPw6avHr6SqyU6
	6aZuFhLzI4KmXXRFBRwzEKGb5SH0IjgKStl1lMihPLiGB83i4CwogEIX5LZDVX9ZM3FCHamuuKV
	L1Ql954UvetoYXloiJqHwEfpVSTWN1yocNkjFb030qK2VnwLCYgB5sAcx3qca6ltbqwtyjT8z1E
	dF/roCD62R/u/2zQm6EQOCdjSZ3aY8R9ueKNE67WNL12iAaRzf8F8hWCY2s=
X-Received: by 2002:a05:7300:c695:b0:37f:73f9:aee7 with SMTP id 5a478bee46e88-3856c9a6408mr6641670eec.5.1795264112075;
        Sat, 21 Nov 2026 04:28:32 -0800 (PST)
Received: from G7XWH7K1F3 ([2408:8256:2e80:7371:8549:3fe7:526f:af9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm18941986eec.27.2026.11.21.04.28.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 21 Nov 2026 04:28:31 -0800 (PST)
From: Zhao Li <enderaoelyther@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	=?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>,
	"Lucien . Jheng" <lucienzx159@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: air_en8811h: check PBUS register read errors
Date: Sat, 21 Nov 2026 20:27:58 +0800
Message-ID: <20261121122758.7136-1-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <439bfedb-fc9f-4e41-a87d-f5e6a3b7950c@lunn.ch>
References: <20261120062001.38233-1-enderaoelyther@gmail.com> <439bfedb-fc9f-4e41-a87d-f5e6a3b7950c@lunn.ch>
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

On Fri, Nov 20, 2026 at 02:15:00PM +0100, Andrew Lunn wrote:
> >  		/* We do not know what errors this check is supposed
> >  		 * catch or what to do about a failure. So print the
> >  		 * result and continue like the vendor driver does.
> >  		 */
> >  		if (pbus_value & AN8811HB_CRC_ST) {
> > -			air_phy_buckpbus_reg_read(phydev, mon3, &pbus_value);
> > +			ret = air_phy_buckpbus_reg_read(phydev, mon3,
> > +							&pbus_value);
> > +			if (ret < 0)
> > +				return ret;
>
> Please could you explain your understanding how this change and the
> comment go together? You did read the comment didn't you?

Yes, I did.

The failure mentioned in the comment is a firmware CRC mismatch
(AN8811HB_CRC_CHECK_PASS clear in mon3 once AN8811HB_CRC_ST is set in
mon2). That behavior is unchanged: when reading mon3 succeeds, a CRC
FAIL is only logged via phydev_dbg(), AN8811HB_CRC_RD_EN is cleared,
and firmware loading continues.

The added check handles a PBUS/MDIO register read failure instead. If
air_phy_buckpbus_reg_read() returns an error, pbus_value is not updated
and still holds the mon2 status word, so phydev_dbg() would report PASS
or FAIL decoded from the wrong register.

an8811hb_check_crc() already propagates PBUS errors from the
air_phy_buckpbus_reg_modify() calls at the start and end of the check
(and returns -ENODEV on timeout), so propagating errors from the three
PBUS reads in between keeps bus-error handling consistent.

If the comment now looks misleading right above the mon3 read check, I
can move it down above phydev_dbg() in a v3.

Thanks,
Zhao
