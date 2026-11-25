Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573101;
	b=NcgKrrZWohmqARr8O4jIrEK9GCRU//PzcteZnnZTjAUaiifEXKMYeT7Fpg219wC4BmOi
	 kG2/VcIIf0ZFrPWLmYSfcbzXDgKeNhu7Ul0PEpyjs+7hwNymg1h8e3aZD8zYYBbxSJOHW
	 yUE/MqQxRibX5E2xauT8KOcJHHSQyDPYzvejdJCUEq3/7+UZCMa3Z5v4NdACh6ukb3KDv
	 lPvCjqqHx5PkBoO2PR55AsXbL7mrUb9yqs7NiTPcZXjUgp5nqhvGl1jFwSFYT/LdKfWpH
	 VVbULlvTNWrpqRyFKj7dX7zOu+uWqrCzlCAeOw0tXbMG7ad+mqBtEQMOXpr/uUYTpig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573101;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 Content-Type:MIME-Version:Content-Transfer-Encoding;
	bh=BfBc2nl/+x1jei32QWJml8gTyYfpGpADR+dK5QnbKzw=;
	b=M0UyDNj1uYvK5pE68Fg8hCAGZCFbglY5siBPiI6OvH5ZNPp9kAI5vpycdc/PliqeRS1N
	 k4NdJR3WSSMb9g3o0LCgluTtC8iXjDx4w3V5TTOsT+RlJtspU4EhfGZAJdLdi65y1LCX9
	 9ifuRfXO7Ij1bFcdaEKLhI3xedZpYS/yEP5/pTv1mTIPS2KQjT5Qs55eq6xWZVoTUZM0W
	 kzZVp89sdfdHhchIjmXgKynZH4NCNQ95Wyeiso5OYsVbo2DTtXgWIoKfU8X37kM9V6zvg
	 9QZ7vK0S/i17DhSFNKDMKQvstBahqnx/9RH9Alvx9mooetImcPy3ZSTaGW1OytcRdkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMUfAWXc;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F05B6606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F05B6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mMUfAWXc
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8c4cc85a315so3612115b3a.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795573100; x=1796177900; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BfBc2nl/+x1jei32QWJml8gTyYfpGpADR+dK5QnbKzw=;
        b=mMUfAWXcVM1xIZ/sjsn1fq08fH4cNvvV+oUQ3eA29ZMZ7A+eR49KLC6qpO8DNy1F2r
         gkd92auy0Mt4Zky/nz7SbVEL/AGIvelnKaoFgD+J+iDepSfvxxqWY0+T0Z39kxdHTzTY
         eMscrxm14uebLO9hUbvAA+qdI7KIr5bdpvPWPLiyqQe+mp5hQH4oZ5Ub3qD3qJ74mSua
         sFJIhhKkRaV9B23MWw4rMZLzDyZ7CbJxvlRCJ6Qpqb1m64EzWOGlB1eu9cvA2wprbAwF
         KXWhsJVnHVM8dnPdGTgKarfqJIVO7dc6UBO0xheja2CQ0m0G+8S0YM5Dy4YVRFWmMctE
         dIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795573100; x=1796177900;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BfBc2nl/+x1jei32QWJml8gTyYfpGpADR+dK5QnbKzw=;
        b=Tp3FUQiG3dAx3h++hlHCV8ICZQLPgmX0hI/aGapLm9/INRRs2Z4TIUY3nu0me+g9XO
         a6VGSMUNE4//xhxzvmjaAho5OFtX4KAg6u0LbFsdLjx/ZVHdVpzwyEv67GWhancBEmmD
         ZZ/ePsiadMtYoERj0o3q7WN97FqxQC9SBH+TMRWh4CxoNdDA1PWbfqZywNlCrnK5Pv9a
         IofpucmMDFTI3q5whOn91FtqFLI/Zu6wgnskM0tvZT1k8qOKQbFrix5c+YYMccnGWohH
         HvezNYZXxUZP5Hw+YGkRe0Ppphu87waqFxBZU+1P5lHm/+UqBL+hBUMJlGyWCC8CrDO8
         gSBQ==
X-Forwarded-Encrypted: i=1; AL+hErFB4BYD+AQZoP+mea5PQw7JrDXH01/344Kt8frLIFZhlCxSUfJoEr693plz/oDw7ZQ/1HVFZvc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AVYyhhPWYy9I1QAEvb0wBRRTLjQf/hKlBoJ//+51MEG6lyRGO
	uZ9RjiVb1p/tlHysJkOqhLIMxX0VdQixVmJwhwGPqvC+doVFW6klob7q
X-Gm-Gg: AZFdTZdPJ9FDCEe2kZbhRfqwXwYVURGrfjO2fiM2UoevBiDP9EdCE+3ZLS9z5eIEAla
	4ZEcm33UNHiHrea6Kq3f3i8ZZWxfWPAmeK4MwoDok1NBGa0Ri0GnOWpncNGyygl3bpnaGjctyC8
	qt2uPOpT4OpoFpiajuKDxoYmNJFl7IAFHYR/FlWFBst0sOAOXWBg1c9PZ8dXtz4Td1NgP4UKQvE
	PNVioq9TEYfHYY87rFU57qAMWngyNKvip1g9m157eMNFzvzBNWa2kf358gJkjEAX0hDMI+W2CkL
	J9barYmG8Bp92r0URvEDypIqWynEDnJHE4VyJLphi1o6ek1t4qPLi+kGYyoCRJo46pH9pWgzIZt
	WGXDwkBUP3dNHAHVk1klmN8rToqTsEc9c4V/vKCw9ItzCWA1MXUNm25iLFW+i7beT7CeTXIu7Zt
	aN5dluKyqLgegM7M8E83FGpzKEFHS3oYugrZ7gYBj6OSzIBPgvVxCeGiLbW+4pPeCHZwHapSCEJ
	LSJVksUt6UCBLqrXr3E6Ln87ounKBK+ASmCyQjWxGGZZ72vPXNZvaWLoGzscUqSgcvVO4FUW8LX
	n7xpv74vVBlx61z5N71KzJKwJg3DswGmhyF8DLQpDn1rw+gejkp6d3oqmahfIE5nH6sTFTNUTIH
	LDVAuudvliGH3mekUZjItCi8CR+DOZcen4BLQTP2YusIzSBa/lpIpkldzyqAloCDEzw==
X-Received: by 2002:aa7:88cf:0:b0:8b6:594d:7030 with SMTP id d2e1a72fcca58-8c87ca51fe7mr14842703b3a.42.1795573100263;
        Tue, 24 Nov 2026 18:18:20 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([180.166.22.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e45eccsm8048734b3a.31.2026.11.24.18.18.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 24 Nov 2026 18:18:19 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	kunit-dev@googlegroups.com,
	pablo@netfilter.org,
	lfinke@student.ethz.ch,
	netfilter-devel@vger.kernel.org,
	jhs@mojatatu.com,
	jiri@resnulli.us,
	netdev@vger.kernel.org
Subject: Re: [PATCH v2 0/2] lib/ts_fsm: preserve patterns across tc dump and restore
Date: Wed, 25 Nov 2026 10:18:14 +0800
Message-ID: <20261125101335.7868acd102b6-ts-fsm-ping-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109103454.50617-1-zhiqizhangg@gmail.com>
References: <20261101081736.51803-1-zhiqizhangg@gmail.com> <20261109103454.50617-1-zhiqizhangg@gmail.com>
Content-Type: text/plain; charset="utf-8"
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

Hi Andrew and all,

A follow-up ping on this two-patch series, sent on November 1:

https://lore.kernel.org/all/20261101081736.51803-1-zhiqizhangg@gmail.com/

It fixes a userspace-visible issue where restoring a tc FSM text ematch
from its dump can change which packets the filter matches, or fail with
EINVAL.

v2 describes that impact, splits the fix from the KUnit tests, adds the
exported-pattern equality assertion, and includes Cc: stable on the fix.

Could you please advise which tree should carry this series, and whether
any further changes are needed before it can be picked up? I would also
appreciate guidance on MAINTAINERS coverage for the new
lib/tests/textsearch_fsm_kunit.c file. I can prepare a follow-up revision
once the intended coverage is clear.

Thanks for your time,
Zhiqi
