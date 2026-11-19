Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110434;
	b=15TEzgnHOspTCuDwmCoFFUdpUS3cmNMwMt6aKT1fOj2AofA/cOk6sG67k5j9DYkPTgm9
	 v+fn/XcURDqI81Mfl/B5ds6IbWNVa04jObITBP4VI55JUZEXBpiUjkziqCay4xZlGiWfw
	 AaDpKVSH+k2MsIU62ffwWkx2Fz12a718bpnQ0ZyPfK7TWLVWV5hGqDEFEO6b3Q+oPGXGK
	 hWS3/ay2daQ+5geUrhraIB2irGpFcMq9lGHyURmCwVeP0mzo0vbdlqaLJqS6XGkeyM2sz
	 e+zPASBHvsSQQIJyCLHIJb2k6cAXKOTptty0xHIabWzVsV4e/Gl8ZmWjrZlmlaBLDLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110434;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=jA7L51eZFG4wqsC1MFVIKmRTCU9z9tkqrhEZ8kU+Blk=;
	b=3DXHebGh/TaK91DTGfoiqvmbk6Pkd003FwAbFlnPZcwHddLgO/Vo705cb51lI2IgcX6V
	 3xHUaK+q53kmz2ugSKVWfJxVSStzE+i4OEp/Yxgj9o0W0xQMyWL0foQ8JU2LXVOawfziA
	 EAnfcIimGap9Y1Y6o53ms6fQqJSL4TMWjWoxqqc1mqRU/MCZl/by75UkNn5dTa/b233xI
	 c2CpISrxz8Y/3TDhHwQgXVMrKJ6aOBXvFv3H0I8kTTQAJM+a4J37V5yVWc8ubhJHzb8Nk
	 XEyx4SzRnrQ7MACAVIJFBRCOHRdgI+T+CF8D/tVwQpckDNZ6bxtWji7DwQVy7hzmlCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oDueYk7u;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC234606A32A
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 17:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC234606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=oDueYk7u
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b3e85baf7cso72530a91.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795110433; x=1795715233; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jA7L51eZFG4wqsC1MFVIKmRTCU9z9tkqrhEZ8kU+Blk=;
        b=oDueYk7uG7QpLXBSnsvPBynfqerujgz25M9iCIQlQm5Q9k5JXnEKvNmXl+C/In2Vqg
         KTO8m8bssuhLM1YQltPNRvhzpp0l3aibGHmtqCnTtYYMkYM/8X4SooY8T3PG9amimivS
         WvOXzEOdBaYBGOaKiAKANTuRuvsAo4akje9WvJsK+BIlx8YPFxzOsnDsa+nQtWB2rwfr
         zQnriJMPj4dCubTMbkcvemmc7hrlFQuXJiNE07T0pyPFbMuLNzBeVno/ocyHUczrqa+r
         O5pBDzONoHKGrg8vkqEKIT+WWdkBP0UfQXoX8ZppwPTr43TwMvtQD+DDM0rRffkV6TSI
         Jgiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110433; x=1795715233;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jA7L51eZFG4wqsC1MFVIKmRTCU9z9tkqrhEZ8kU+Blk=;
        b=GbyjiMwNtui1EFtDiTGUNt95KrI4xep336Dx2W8nSccgaHiHdUSaEL3jjdMbwVgnHJ
         7GEkaoQrQcf1Vdbgv6dG7kIZqxc6i2yy2S3eujOIdnIoeJPCp7FfcSIz8kINiHhH/Qq3
         6Oi1hctxazSjSm0oY8gsvh6+3a4Q1I5UvrbHfEuUNdKw5EsMB7/jIueR5D+2nVjCKu5L
         yHQG0pP6lFA7w0lCexERqF+TEFYKVVCed9JF2T+JBiUP6GT0zILKLmOWEbB2cUcXtaoi
         r7wjajuGnWBXHw6FTq0IlbPALfGML7TEVOrlx0kWwHOX+OTI9oxB3Ed+0dyQsVj48XTX
         oDpQ==
X-Gm-Message-State: APuU4Z8oWPjD57/QcJuX5klOLnrc4BgnbHPIFcvdxWBlxQCo/NLfKOP7
	pTTRKrb2vVAz75sPee6eWtURH9JfyKZzto7yTLd5i1KmliNtn5plbFEpHxm7LTjCgYXVuocI/4p
	TURC+26w=
X-Gm-Gg: AZFdTZdzEmq/QcOeCIeI3x+YOeST5WolQeKQq/NMbGA5gZEtDB416tseF5UGycNgQik
	/Se5eJlnbS23/v07Jv+s4vCA/+RqxvKPkKNt70XAzAsQbMMW3pSpGhdK0TDtkD9crg+ngRd/uWD
	gr8ZSqhC5E+KkgypRQvXGT0tVTNPcye7ItTw5rRf6N1TW56GguoO9Gta27yD4+IRDVH7/3cTzNg
	I0Kyt6H9fOChW1IC6mroeQf0ge8qYdItG2XQxsAmr0oUegE8UtKksAiUPhg9zOlKnrtmvwfI6gb
	aVD6T2SRrpNdLms/SfrCQvGi829Pd1XGci6ntwO7diajq6dCa5gO8Yl5wzYkwWgPxm1wMAF/XlK
	BsgngEtf1u4EKrDcs90ZjrHqGBz6Qi50+w33x6bTyluvRKhe8zBMJ/ZteBqCCNff6iJmkUFyegY
	JwTL03jnpxvNSQEb1TuuhYTNOm8gj3ECrj8NY+Wb46bdAloRE1Tleb8VWbtTMcYXPkpLuESnp9b
	h9gSOimAHeMBWCtzpmSGzZnssmFkV9CCXu8Q7mPgLKfn62SdyVjouX++aKv7HuJd6PWHh5xH5S+
	IAdNiN7+aP/N9i0dj9I1mdn1p5jIRjNULDO4BWj9rjegZKdU+Q3Enoe18GfUFbFCSEw2h9U=
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr76906a91.57.1795110433087;
        Thu, 19 Nov 2026 09:47:13 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c13sm326249a91.14.2026.11.19.09.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:47:12 -0800 (PST)
Date: Thu, 19 Nov 2026 09:47:11 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Jamal Hadi Salim <jhs@mojatatu.com>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, Thomas Graf <tgraf@suug.ch>,
 Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov
 <ast@plumgrid.com>, Jiri Pirko <jiri@resnulli.us>
Subject: Re: [PATCH iproute2-next 3/5] tc: remove eBPF map export and exec
 bpf import
Message-ID: <20261119094711.6049b21a@phoenix.local>
In-Reply-To: <CAM0EoMkLUeJdzCBxsknqxSKAZ2Q7WhAB9ifV_tKXne4fPxY7YA@mail.gmail.com>
References: <20261119001539.2868072-1-stephen@networkplumber.org>
	<20261119001539.2868072-4-stephen@networkplumber.org>
	<CAM0EoMkLUeJdzCBxsknqxSKAZ2Q7WhAB9ifV_tKXne4fPxY7YA@mail.gmail.com>
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

On Thu, 19 Nov 2026 04:19:50 -0500
Jamal Hadi Salim <jhs@mojatatu.com> wrote:

> I dont think this code changes in iproute2-next (didnt try iproute2
> tree) - but for tc testing i use:
> https://git.kernel.org/pub/scm/network/iproute2/iproute2-next.git
> (origin/main = 9eee7bb8 ("Merge remote-tracking branch 'main/main'
> into next", 2026-11-18))
> libbpf 1.3.0 default and LIBBPF_FORCE=off
> 
>      m_bpf.c:107:25: error: 'bpf_obj' undeclared (first use in this function)
>      m_bpf.c:108:25: error: 'bpf_uds_name' undeclared (first use in
> this function)
>      m_bpf.c:108:43: error: 'struct bpf_cfg_in' has no member named 'uds'
>      make[1]: *** [../config.mk:47: m_bpf.o] Error 1
>      make: *** [Makefile:67: all] Error 2
> 
> suspect: the patch removes this declaration?
> -  const char *bpf_obj = NULL, *bpf_uds_name = NULL;
> 
> Attached fixes it.

I suspect you need to do a "make distclean" and rebuild.
There should no longer be and --libbpf options in config and no way to force off.
