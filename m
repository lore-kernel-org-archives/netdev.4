Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795800890;
	b=5hYTh42w6RxfXcTsg6LLYeWtCIQSov+jKTx91WktxoCQzZyAdQCPy+CfsgnAUbu4Gi0V
	 VotDckZwVnvDDxHMgUPY5lu46fe/G5Lf/vT1CTudEFr2vdcxz6+poQkPmeIbvJmxZ4Chw
	 +1ssrpMZN/njsHN91KcYZrRKlFYk5nxky3sdYJIakBBN5OqBlQFmtlf2v/PQYP9VGK7u5
	 r1BPcSTTW5uHHAPqX2796DPkiTlJiapSSZsGYVSjh+PZpwEpMmXNrz3LhSYbGneVf6xYe
	 RtNymfoQpZdG54/Izz+kq3oh3ROiDBdKsS1yTavx0LJJ0H/lCkAQPQU25y3a1d4zHEA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795800890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0cry1QYsMiE3GcTJ1U56O5LSXaxAFrv/OCa56hIGPb0=;
	b=TzzwQr65eUid5CS6/SRvseUGXOgaSFFrRezklkPv14jnNQG2KIEOX+g4PkPMXn6f/Ka/
	 qo4Dp+usCF/E1pgKGU+WdmS5jFAdKMZeobWlyxlcx/b66v/nYwbCQOCxkR+bjKZoM2dFh
	 AmZFMEsXM7uB8qXfRoABnlfN9zwHWjpK8s1yWVNR182yst7XD3AGWPh5p9gQKV0Jv5rGK
	 9PAqim/XTmRjOOfO5u++0EenPudESS5ltl2ciaRWX/ZeeO5nZiDiLkbNIx/EzAgcz98rw
	 5EaFtlToJcrLj4Y2fNf8xmdQU9NniI9Vq7q1UaTSul2XjXdH+2gFfDyv0jWNjIfs6sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqbseWq3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2D6606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 17:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D2D6606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqbseWq3
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491971ac844so7366248f8f.2
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795800889; cv=none;
        d=google.com; s=arc-20260327;
        b=oe6vyRZ7/ABS64iRTg7S8S6KRaKik3n1r67F1dkTLGo1logdPnRhK2Rt1o8BEDt8IN
         UVWBYDHEZ4SyeeV8JtqTYhzDgaHIVAjtNm8NkSOb209RZm1uF5dpe3hqJRBKX6wJKrr1
         E1v2Lkp5ftqKVtrNxXhuioWO+Bqdg8ZLID+kGczKgJC8fUFuocjoltji8MHNS9iJivve
         KbCMOqmaLrNEYP2xP5NxYVo7HqS8Ywqocd/l/fqAnPO30fTHlZeA7vtcQKvRswyT4xJ3
         GSEGQf6WgJDBRyVBj+w5Hvj8AjfxaVR4OBPB8xwSEtQHGCxHSHgDO+AfNuJYMr/Mb814
         YO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0cry1QYsMiE3GcTJ1U56O5LSXaxAFrv/OCa56hIGPb0=;
        fh=sgMlnpPIkoatpKB1xJDHQICPZqesERPploa6LoXqXLk=;
        b=WFZ9mrw4t/cavsmFG2582cjwtuiVQomHbbiTBMYXCZvXfv8C3QFdJqEvPTEHpwv0il
         JxLP/CqE0oKTkCSyCniJe+qOKXS4jwfEGE6yiTBrHz02085UqfqQegopibpj8Q9/hYOh
         JZfp6R0k/JVqpSkEP0L96a3Kw7WfAvw71OGxEsPZRSWghs8H4kU7K6rJvAjfXj+th3rO
         gIlZDdRxZDMU4Uq0+1j1qhjGvtLKxKOWvjvvhapz7j8O6uo9QhRPApgCtoVCXRpdfHQO
         MovNBTlbg00tG8NG+IwFKqzd+cbOvBAmZQaCE/EnJ5R4K7/6DNsS/qxTVVMWIEUqQi0I
         HlQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795800889; x=1796405689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0cry1QYsMiE3GcTJ1U56O5LSXaxAFrv/OCa56hIGPb0=;
        b=iqbseWq3fFzbbStynEkT3aseKkmIXjasPxjv3G6zZNtmADUYF0M5AYH7qZefaveRIK
         +1HPF+mFV9CanXGGOSuXDT4sYzFX8vKBTROXCWilqqaRW10xdzJFiHBW5IrvoG9gmQ0P
         lLX3lfEwlYZnVB7zRyeQxTqruIRDN2ppcS1smRBg9zq7fvGXYUOEP1FpSFAlvKeKpAq5
         d7qcYW65PoDv8mU0i2S1U0JvSyzSHp8tW76wQxM3JkbrbFjzuB3Iax9/KTdUNK0fMcel
         56oHXPWEEnyEiB2IO3cLohNnMXSPtKsl8F2V7wFNTV6FfxXmkRoTfACRASJmCZluOZ5N
         2I4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795800889; x=1796405689;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0cry1QYsMiE3GcTJ1U56O5LSXaxAFrv/OCa56hIGPb0=;
        b=fHiRpFaB9gR5ZV8CLOzWZukuq7APQ6OXXHFPtUfRN6ydeL5ZEl98efsbAsfOne1tS2
         uahCTxow9Gghdn6W1WCyXxowKSX2l/nKLa9IfEKs5koAIk7dYxt5i0Q6g6hgrTbcQriA
         q2ye/OLDtYSXiZEZm/sUVimL+ewiV9Pm55ypkHkGFhB33BkXywYUE9s6hCLMol8qDoAg
         HKia+fDgUjiHDcHiuOivf3RqddE+n+wYX/ehj9lsXPcqyI9u8G9UjRXLFzH5d5CAZ6R3
         r5iwGJoGHziD4V+znaTAWV6lMvi0ugSoJ1wwofvv8zwA7a9rAFvwVaMzObrnty63k8sQ
         PBgA==
X-Gm-Message-State: APuU4Z8g/sw7w/AyB58h1dV6+JXk/QfscUml21CWBJF67CB9lYnadnDb
	eL32iwFUAH7UcBwUQjkyNGQBdEw4rvsqifVameCd83OeLwTkwJRToGvmeYEgBgRSEUj6Rw/jIHG
	8Pq81Xi1R33S18fVX9aAVtzPpHNTjfaQ=
X-Gm-Gg: AZFdTZfxbaKdcNCipLQjRjU/V9MXv/R/pO6QdJeqevpsmHXAx4Du06Nm+j6bd71Xi3C
	cD8afb7h+8/uypW6GtpYSkGPeTYxBcf6PBCabGOySEm5mkH5LbGmkibOEI8YzYPV+HFprU46F5S
	ur+AIfKNGAqvNfF9wLmcK5dUv7tl5rCo8vrMO4rO/UVRntwFgQqMsD5LKez+djEVw9WCPYJHd1l
	VTLXTGKwA1pNqA2YGv6faWX0kvAnrwCPw5043wyUw9lvfVHCXLKRK5r/b/f1NKkTPrrELeOXmXC
	6LT/Jj/jAJFH1zJwOUsNVnMQ3rUiP+VMIuyriRYaWIG+ER2Q8PmI++8jtFg9UEXf+udGYnQh/32
	rMfLe8eNJg5pVAe8dZK+qTexjfdbJpno/IRNd3FXj51/OXb2FaY81CA6rHixVOZQXpoytQGEBMJ
	6JgpolryJUfmEmvtOGjnem0B+DhfDqvubJ8qOmast5bhs0SjWFwky1qQ==
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id
 ffacd0b85a97d-4abb0c5d53fmr47509843f8f.16.1795800888445; Fri, 27 Nov 2026
 09:34:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179555667294.7867.14016739586914876839.stgit@ahduyck-xeon-server.home.arpa>
 <179577269832.3135.7443187068447815834@kernel.org>
In-Reply-To: <179577269832.3135.7443187068447815834@kernel.org>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 27 Nov 2026 09:34:11 -0800
X-Gm-Features: Aa3M54r1_TVCRA1JT_YV989xkHkD5xf43Ig85tVxzevdSsbDM6bT93DfdxqYxwI
Message-ID: <CAKgT0UfBW_XL_8cBJ5txwmD5Hv4Ubs=-qwwyxKwKwWPzuT-5XQ@mail.gmail.com>
Subject: Re: [net PATCH 2/3] fbnic: Do not report a FW coredump info error as
 a parse failure
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, horms@kernel.org, kernel-team@meta.com, kuba@kernel.org, 
	pabeni@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 1:45=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] The fix is incomplete.
>
> --
>
> fbnic: Do not report a FW coredump info error as a parse failure
>
> This patch makes fbnic_fw_parse_coredump_info_resp() return 0 once the
> completion has been filled in. A firmware-reported error, or -ENOENT when
> no coredump is available, then no longer reaches the mailbox Rx path,
> which would log it as an unprocessable message with a hex dump.
>
> > diff --git a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c b/drivers/net/e=
thernet/meta/fbnic/fbnic_fw.c
> > index e00d626f64384..9a3df37674424 100644
> > --- a/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> > +++ b/drivers/net/ethernet/meta/fbnic/fbnic_fw.c
> > @@ -960,7 +960,7 @@ fbnic_fw_parse_coredump_info_resp(void *opaque, str=
uct fbnic_tlv_msg **results)
> >       complete(&cmpl_data->done);
> >       fbnic_fw_put_cmpl(cmpl_data);
> >
> > -     return err;
> > +     return 0;
> >  }
>
> [Severity: Medium]
>
> This fixes the coredump info handler. Is the same problem still present i=
n
> fbnic_fw_parse_coredump_resp()? That handler came in with the same Fixes:
> commit and runs in the same devlink health dump flow,
> fbnic_fw_reporter_dump():
>
> fbnic_fw_parse_coredump_resp() {
>     ...
>         err =3D fta_get_sint(results, FBNIC_FW_COREDUMP_READ_ERROR);
>         if (err)
>                 goto msg_err;
>     ...
> msg_err:
>         cmpl_data->result =3D err;
>         complete(&cmpl_data->done);
>         fbnic_fw_put_cmpl(cmpl_data);
>
>         return err;
> }
>
> fbnic_fw_parse_qsfp_read_resp() does the same thing with
> FBNIC_FW_QSFP_ERROR. It stores the error in cmpl_data->result, completes
> the request, and then returns err.
>
> fbnic_tlv_msg_parse() returns the handler's value unchanged, and
> fbnic_mbx_process_rx_msgs() then does this:
>
>                 err =3D fbnic_tlv_msg_parse(fbd, msg, fbnic_fw_tlv_parser=
);
>                 if (err) {
>                         dev_warn(fbd->dev, "Unable to process message: %d=
\n",
>                                  err);
>                         print_hex_dump(KERN_WARNING, "fbnic:",
>                                        DUMP_PREFIX_OFFSET, 16, 2,
>                                        msg, length, true);
>                 }
>
> So when the firmware reports an error on a coredump read chunk or a QSFP
> EEPROM read, the driver still logs the parse-failure warning and hex dump=
.
> The callers already get the error through the completion. The later
> patches in the series do not touch fbnic_fw.c, so both handlers are
> unchanged at the end of the series.
>
> Both handlers also have real malformed-message paths: -EINVAL for an
> offset, length, bank or page mismatch, and -ENODATA for missing data. A
> blanket return 0 would hide useful warnings in those cases.
>
> Could these handlers follow the fbnic_fw_parse_tsene_read_resp() pattern
> the commit message mentions? That handler keeps the firmware error in a
> separate err_resp that only goes into the completion, and still returns
> local validation errors:
>
>         err_resp =3D fta_get_sint(results, FBNIC_FW_TSENE_ERROR);
>         if (err_resp)
>                 goto msg_err;
>     ...
> msg_err:
>         cmpl_data->result =3D err_resp ? : err;
>         complete(&cmpl_data->done);
>         fbnic_fw_put_cmpl(cmpl_data);
>
>         return err;
>
> >
> >  /**

This is similar but isn't exactly the same issue. The problem with the
coredump_info_resp was that if there wasn't a coredump present it was
also being treated as an error which is the bigger issue being fixed.

I agree that an error response should be treated as not a parsing
error, but that would likely be a better candidate for net-next rather
than net since this is a much less common error so the priority is
much lower, and the fix itself is more complex since there are parsing
errors that are handled after the error response handling.
