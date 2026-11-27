Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772680;
	b=R2ytJkTMsKc2JHVB8/1LosQfY+/cCOGHIINnmG9hH2CR2c45vaO6w1XEj2svguMBJeYA
	 ELT32d/9ho/M+P5owKoTBRttFWx/jP4gJ2jO6sxPSl27HBVRAtAt8GeeF0ng1ltbmblh2
	 J50YBs8W+oS6HM3YUYD6pAmC30SqqrQPMevVMExgkX0JkDmB6cboKqQc0/tLQm5c02xX/
	 T5SqOlHfL8L7/yfv60yhEH0ttsCX5JjXl2Irqlj/F2z+lsx7hfPgBA8azT/nu5/ZTZvIL
	 cqLg6MandqzQVWL692L5uRCaVMjbqchqPEtvhDQz+YLLzFCGdSBixwAkonpgD/OHjIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cykXbyQ1zuoVlOh8IpIbHTiOvsUeycZWPIx1LYq5lNE=;
	b=MpsI2HZhJPJww9C5VfDCYYbfd8zcDAYgRRZ/E0nNU4+obWQzqZfp7ch9hchsr8HgIRGx
	 vXKE2i6BB4kkJJNQodvrmwNtt+9cezPnwCFfwwEBmVc+exykh/2tGH3QLc4ACHJenYdKP
	 4I5JvGY3vsywGcGB37plyAUlTNWihCNuM/Z4sdePKHcfJt0/SgjAnGHDwFZZIYKy1lAO1
	 eXDrmgZZI6iRCSkyLy76qxycdMEaKz+Oe5BjfCF+HiPgSE8F6mDvt2bK7R2hljH7Hfkkv
	 9dSLc1iCCMhQFGT7Mk0K2IQge+Gh9oH9YE3gf9B0/QnA/4aR5IHGNXWYIXWjdcv3mSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=JEMfPvrh;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23894606A332
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23894606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=JEMfPvrh
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-38644aedba1so11791002eec.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795772679; x=1796377479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cykXbyQ1zuoVlOh8IpIbHTiOvsUeycZWPIx1LYq5lNE=;
        b=JEMfPvrhd/O8f4wNesuPL6+v7mLzKKMqsfE2oIaBrYCpSpyTWsc4XIwBnXCYmHlAYn
         TItZLpydmLHbbLeHL1Zz2cX/qTojDJg06VZ4hnxK1A9XNb/yxQYyiqx9VAhP69v/1gjJ
         lwvHEplrdIqAfSA+b2Pvb9isAv08e9RBdnNpyDlQTddfCjK8aeV1MuHqLwmt/mZSx7PY
         C/3QF6aZMxMM4RCA0sT7EtpsxeCROP4wQdTTI+ByfxrXdpqVzol6n7lIOMr5QbnXoK6+
         O55INPYwLZ8ydn8ZgrMZ6A9Gpay7w/foVIhdAgfPTFZiuO93aX3iGZ5Elqj1v/WGtEB4
         +W1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772679; x=1796377479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cykXbyQ1zuoVlOh8IpIbHTiOvsUeycZWPIx1LYq5lNE=;
        b=lzyeADFCXslgG9xJSXlpUuiJ/cOKBlCYF88bZMNlITTXfFQk1C+5yn5ziQxxUT6Dbh
         I2X2qDBPlTKcsQ7tg5X8qfSnc/LlXOFrQcQERRyeuTKevTBX+cr0GXEwEBdhAaWuv+Mk
         Uh+EMalVrUq53lYpX1mnCucva8KNYexTOy4x09DZXe4MZs/0gDQc8/1tqfBg1eo3PIce
         Iv+oZYJEl9WqtM2WuNrsPRizGnrvzdjZ+TvMajiDp3RPRnYH6HcrFrTJvCRXx2HbpznY
         VJrfTSyPXt0vI2ougEFsfFq1prLPFJpf+OWp8EACV3EDsRNdU3VVa2PGrFCA5XORijC3
         MQfQ==
X-Forwarded-Encrypted: i=1; AL+hErE2c0m+oPTOOm5ajO3tVRK8+/lQFZDenJuo0UlV4dMvzdtRfJgROVUApz2yBcQYOUSie1yVRiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I2bYyX+cspT2zrtHLS/fop3Cwcv0b7IpXiypl8R6Y0hzW7jsJ
	R/Jnwwt3PjXwB2v3n9WXgKiFC+ZMB0lEvri1I+1iZeGhPYok7LL1/MKYAXkuY/ivTRg=
X-Gm-Gg: AZFdTZet0lyYWHh9szou9Z2aiSN6APFRAsZtg+jt5Vqbq1UPaT7c3R+opDGsRISRGl4
	eSIJBVHrDYQGgGP4MV6z/2alemTSlk9EQlKRLLMpZmMTVkWuqpsGlD5/+Qu6EIAm+wlYJCUUzwG
	+4jHYkNQwFLpv1a74GpnbPtFxfL0v34Hr94w48f1lQapOytQ69pf5xqmm+kfHB9pFXXfZLiGlA8
	o4szYzqh+YLQA7A17uD3HY57jvzcaX6ixnFYiV2rSb1Qkqg+MqSVKeqMR+8ffWz6LG1mp0WidkD
	TJLcOd9T5qDxxX0Og8/505HiYrth6Gn5YeW2BkNMsz06lavvZYy6A2/ifLznqHNL80314bv+VGw
	e77nrKhi0lNpP4lixjsJk/LBD8v4BLvXNACLQ/DSemGJ9mKxAAxM2yGF55B6hcUnyrpsFAlh9wk
	drimilClqWiqeA3O1vXkqRYWEytfQR8GOd9kDL5mttoRZ8iYKMd/TJhbPEouyZ5SULdlbwdr4Ta
	bSPmMBE1kgRjCd/ipWytcVvUTeqXhY3RO/jtcxJLWN9k7MA6/7o9PmPVBuUuCq7c8FEosy1RGvW
	dDN2lRmeRDXSpMu9PF53zxNLKs6x3mnlY1lWmLz5lnBJ7w/v/0WFrqyMiOQyskluhsu+MoYeNi7
	LJZR89e7jEDwUvIrrTXogMzAhyKn6oH19SvVguoW/9ieoFgPytQ==
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr21980805eec.11.1795772679191;
        Fri, 27 Nov 2026 01:44:39 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aa203267sm40436428eec.0.2026.11.27.01.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:44:38 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: netdev-bot+sashiko@kernel.org
Cc: ap420073@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	horms@kernel.org
Subject: Re: [PATCH net-next v2 12/12] selftests: net: add amt_gw_v6.sh for the IPv6 netlink attributes
Date: Fri, 27 Nov 2026 09:44:36 +0000
Message-ID: <20261127094437.2968407-1-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179572062595.3135.5756555149194177847@kernel.org>
References: <20261125191450.2497936-13-omar@blockcast.net> <179572062595.3135.5756555149194177847@kernel.org>
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

On Thu, 26 Nov 2026 19:17:05 +0000, netdev-bot+sashiko@kernel.org wrote:
> Can the first case arm in probe_v6_gateway() ever match?

No. v3 matches "binary attribute size out of range" there, which is
what the exact-length policy reports, and the message quotes it. The
Low finding is fixed in the same place: the probe checks `ip link help`
for amt, and "Unknown device type" and "Operation not supported" skip.

> Can this FAIL branch be reached through anything other than a
> userspace limitation?

No. If the probe link exists the attributes were four bytes long, so a
readback that is not an IPv6 address is an iproute2 that truncated the
literal or prints the address under another key, and the kernel did
what it should. v3 skips, with the readback in the message, and the
branch that failed is gone.

-- 
Omar
