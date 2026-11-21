Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795227542;
	b=sY9a24lEeWceNnKEhPJfJiuPaqvxvzV7UHYca1Mt4b3Md0rStpDp8s4uIqXTtZ4+hRug
	 CYfjjgrYJ3o+xoR2ibJfDZYLWJWP5xnXL1qndxff7t+kyRn74wfm+9u5ApfHvXgqaEAm5
	 CfuFWNNyWgJC8ikmKsh6wcp18CiChjH3yClZl93zdPWMarD5QEqodLhlxrNpc2qSeg7A3
	 D7nDwjul2JzyI/An/6sTCE9s8vDJ3+LOtjtaUhcQ3tsQ6L4kM38Zu9qoK2kFjpfXAStGr
	 kPqlxRUAwit6G21S75GS3buF7KEdqrun6nVaqMyf7rcI166OYYBY6Y8oo5kkyJOvvxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795227542;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=zn8Kyjsw53jLTGDdX9sJTkO/FS5MnySzEubXRQ4KXng=;
	b=fCueC/ONFoWbfoutrZOrrcKvxVDdLpAkzpbzPTQdhmoQe+HLs1S+4FLuxcBy7JMv0gnm
	 6KCJSHj1R+IFgOfcmNiW0ZPlLEnTrgZTnXY1h8tlbGG2qAA//nPYbOMlUb5zSbRkIF8/v
	 bDPUC4/OS2nQC8b/TwU0CS0QfkfAV8TzBvhvTEG84t4G4DJ5Ea8eTjbyUK76PM+vWzfEF
	 ZsofaRsAfRi6jZvmIjwcuKyRqk+4f0P4SBFQRipn9aZi5+MhTHuFjwCPDmRT1eHqJpYJU
	 1MO5RPrqV1UQ/IQd2BtK42rSPDspbixXZ/FwnG6fUyL9A9eoMwo1uhdNdFaXRAkx7iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ypr00Afp;
	arc=none smtp.remote-ip=74.125.82.226
Received: from mail-dy1-f226.google.com (mail-dy1-f226.google.com [74.125.82.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF49B606A6A9
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 02:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF49B606A6A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ypr00Afp
Received: by mail-dy1-f226.google.com with SMTP id 5a478bee46e88-3866a784546so1398189eec.0
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795227539; x=1795832339;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zn8Kyjsw53jLTGDdX9sJTkO/FS5MnySzEubXRQ4KXng=;
        b=JG44v99PxV+kcuHu03txYW+ScHoPATNZin9Ct+W50kdFv9kHjuypEoU1ZuVLE9iMcx
         IRFweVjVcf9xOUqQwSxM9nUiqZs0XksFA0EYcJ/3UA68hBNUThVwOAyhAM8fQnXm1foe
         DxJh0rZROK1BZ7jpmmNHNouHU8ZeaodLtXL1WSbYt0fzQ5oO29OP5ci/bfFCuQXvMzHR
         U3HqRVBGqXodXi9MkQCd7e3dCxz6KhN76kLSt70o5TlV5c1GaKSxrH93NEVvGLCYKLGL
         jNMs/pBUFCsEHm4sdqzgjsIM2tkF6XxHHH3h6NAxxg1MwUYbxqxutCT1Z990skodiToj
         SQ1w==
X-Forwarded-Encrypted: i=1; AL+hErF4rvg4vtq7IrA0lz59g/uJNpTFqWTYtG/HJoJL32gPAprW+89YhwpqOtlnOZQSfm7fBlylVWQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ESnAjrbeNn1BNx4NHOk+5FXChay7RpAukJfj1CgR4/hM3Gh/g
	R1wCMHbbW02LSGZXQ+tlwK9z0xxipPKeDTKMYysuPLEyQPmpYMn9jYeKqmev5ydplZ4CwekrpV9
	EnFyRUp978UrZm2mynIBPneQzHfdLwA6Vj2VSocLemEz4IvOdmymb+YTmFI7SgN0MHLjj399xF4
	tTRgYaA97W+Dt2lKkSShME9mQP40mcHKe3ilc2xmzXi7fENRFrKVxkjZ0Z0ZGkKLu6mbnS+ID+w
	R2XjNsM4Ig=
X-Gm-Gg: AZFdTZdlPWgNENmlqFW5FXrYyF4PxmyJOSbH0aZE55+bXNHaWPbGfFdnAui5hB6NQas
	Z8Yek49ZyDXr9By4GbqCxiaRHaNq0/frlex337Q2cvHGJ19WiXTxayjWTRaEridfWb7hZ5v+58W
	RrZRFqPXJgE21lfxdtwrZpXXH0/yB9W0hcfZYwcBGx9lQBeyDTqqmhsimYKfJNQ12xMR7mS9D2b
	pgHG9b7Q8QF/z7LZBUis148GWxMML1C66EanyjzR59Mm9p1PwzWr7lRreNGxahz2oqAjfU0KJJ1
	8pa8SkJrvZEK0wKiLrdDrL741XkN+lT/tJ3tFVHF+rPuGM/cWIKlHUWQtZ7qpfjC0enl3W+GBlz
	kjymygLWonl0n5ZpxhW4dk+TWrjpkH/KOaawmJk4MhxpIWlxSmrShGWh0mgYBmgthgr9h3ViFYN
	zLIBtvm2fQBY47ng27CqIHnVC2HHIvMXWnw7j9Ag==
X-Received: by 2002:a05:7300:f496:b0:385:551d:854a with SMTP id 5a478bee46e88-38570845477mr4292673eec.28.1795227538552;
        Fri, 20 Nov 2026 18:18:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385673c6e98sm411931eec.16.2026.11.20.18.18.57
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 18:18:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c504991a35eso173055266b.3
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795227536; x=1795832336; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zn8Kyjsw53jLTGDdX9sJTkO/FS5MnySzEubXRQ4KXng=;
        b=Ypr00AfpApaFKcINMNINHh8QOYPs9iKwoa9qyUmQDXVJPoAjrwLxCuaJkcBKaegvNb
         N4HDuhIHT9krint8y2NvkPf951g170yPh4su0zFSNG1OvocXgZ1Xd/KFaLnfu9WM096g
         pOtstNGLe9xTkf2fKdut8l97K/4EMqX8/i8O0=
X-Forwarded-Encrypted: i=1; AL+hErEw89f0UhoYlQ5g0Y5M/PYlkHl+deDVR/PjlDVWpG6XjiKXg0iuMRppFd1ACVFbPtmbD5n9FC0=@vger.kernel.org
X-Received: by 2002:a17:906:9c03:b0:c46:2987:2169 with SMTP id a640c23a62f3a-c513a84c864mr394276866b.24.1795227536424;
        Fri, 20 Nov 2026 18:18:56 -0800 (PST)
X-Received: by 2002:a17:906:9c03:b0:c46:2987:2169 with SMTP id
 a640c23a62f3a-c513a84c864mr394275666b.24.1795227535999; Fri, 20 Nov 2026
 18:18:55 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120035214.369158-1-kuba@kernel.org> <20261120035214.369158-8-kuba@kernel.org>
In-Reply-To: <20261120035214.369158-8-kuba@kernel.org>
From: Michael Chan <michael.chan@broadcom.com>
Date: Fri, 20 Nov 2026 18:18:43 -0800
X-Gm-Features: Aa3M54rlnL-2k1jRYF3IAMwFDZMgWEaMY9uxCA8oDSU06m-vuEqJtPXy-VRlJmI
Message-ID: <CACKFLincJAOP1PRu9S8issYzY-QfV7LLua-MQvra1KcV72hMig@mail.gmail.com>
Subject: Re: [PATCH net-next v2 7/7] eth: bnxt_en: restart Rx queues when
 their IRQ moves to another NUMA node
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	pavan.chebbi@broadcom.com, bjorn@kernel.org, joe@dama.to
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009c93fe0660bffbe8"

--0000000000009c93fe0660bffbe8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 7:52=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> Rx queue memory is allocated on the node of the CPU servicing the queue
> when the device is opened. On a running device it only follows IRQ
> affinity changes if TPH is enabled, as a side effect of the queue
> restart which applies the new TPH Steering Tag.
>
> Schedule the affinity update work whenever the device supports the
> queue API, not just when TPH Steering Tag changed. Queue restart places
> all the memory it reallocates, other than the ring page tables, on
> the page pool's node, so compare the page pool's nid to decide if
> the queue has to move. Only consider queues whose IRQ affinity was set
> from the outside, so that moving one IRQ doesn't restart other queues
> just because CPU hotplug shifted our default spread.
>
> Since we need queue state of the currently allocated queue to compare
> nid - check that the device is still up after errors.
>
> Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> Reviewed-by: Joe Damato <joe@dama.to>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>

Reviewed-by: Michael Chan <michael.chan@broadcom.com>

Just one minor comment below.

> @@ -11978,18 +11978,17 @@ static void bnxt_irq_affinity_notify(struct irq=
_affinity_notify *notify,
>         }
>  #endif
>
> -       if (!bp->tph_mode)
> +       /* Only Rx queues can be restarted to follow the IRQ */

This comment is not quite precise.  If it is a combined channel, the
queue restart also restarts the TX ring for TPH.  Just like my earlier
comment about including the RX CP ring, we can also include the TX and
TX CP ring.

Anyway, no need to respin just to change the comment.  Thanks.

--0000000000009c93fe0660bffbe8
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
DPVtLUtep/P3evQuAtTQRaKedjamBcUpJ7qUhBuv/Z07LlLIlB/vfNSPWe1V+njTezc8m3VfvNEC
qEpXasPSfDgfcuUhcPR+7++oUDaTt9iqGFOjwiURxx08pL6ogSuiT41O4Xu7msabnUE6RY0O0xR5
5UGwbpC1QSmnBq7TAy8oQg/nNw4vowEh3S2lmjdHCOdR270Ygd7jet8WQKa5ia4ZK4QdkS8+5uLt
rMMRyM3QurndiZZJBipjPvEWJR/+jod8867f3n0CAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZbWljaGFlbC5jaGFuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUJbO/Fi7RhZHYmATVQf6NlAH2
qUcwDQYJKoZIhvcNAQELBQADggIBABcLQEF8mPE9o6GHJd52vmHFsKsf8vRmdMEouFxrW+GhXXzg
2/AqqhXeeFZki82D6/5VAPkeVcgDeGZ43Bv89GHnjh/Vv0iCUGHgClZezpWdKCAXkn698xoh1+Wx
K/c/SHMqGWfBSVm1ygKAWkmzJLF/rd4vUE0pjvZVBpNSVkjXgc80dTZcs7OvoFnt14UgvjuYe+Ia
H/ux6819kbi0Tmmj5LwSZW8GXw3zcPmAyEYc0ZDCZk9QckL5yPzMlTAsy0Q+NMVpJ8onLj/mHgTk
Ev8zt1OUE8MlXZj2+wgVY+az2T8rGmqRU2iOzRlJnc86qVwuwjL9AA9v4R13Yt8zYyA7jL0NiBNP
WaOSajKBB5Z/4ZVtcvOMILD1+G+CVZX7GUWERT9NRXw/SyIEMU59lFbuvy4zxe3+RbOleCgp3pze
q8HE2p9rkOJT3MkCNLxe+ij4RytIvPQXACsZeLdfTDUnjeXCDDJ9KugVhuqMelAZc4NissPz8FOn
2NK++r5/QamlFqYRhsFxSBIvhkh2Q/hD3/zy4j17Yf/FUje5uyg03FblSBOk2WYpRpXEuCpyn5pb
bYVIzfhQJgwGfO+L8BAeZIFjO1QL3s/zzn+RBlTl4wdDzh8L9eS+QEDhMcSsqb4fFRDbsoVuRjpx
R5MunSUzk4GcmmM19m7oHhPGeKwIMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMZh03KTi4m/vsqWZxMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCBGqk0d
Eb312NAut+sNMjsYZdY3wEy3z00i1VAGreYMHTAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjEwMjE4NTZaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA8eFyK9m1x1V20QtPlg3RO1gVYV1tZHPE1C0wsEi0f
okxvbwO2I22LbBeqQIEsNMOuVU5meXcHwY5Tr6zKVDv9T6PiNR36SG1bmPQPApfHTI9VIrzHvC04
E/YBEvjjymKxPknT8q14ysBH7kZAWHqjHKMT303YXIWb4ihr9W3py3jPxLE1MCwpIzc4cFtZeIbn
upg9hVNC+p6k6ggwA9vRJ1M8JFudlr/sBisnKzaomDTgdSgMG4R7kyQ4RZkJcwLfEaIKsfZaajq3
GHXBlNn4fspvaSRnGURm0sltdo4/PduRaCqAOZNbHS8BSDVgp4LpB8xRqnTp62J3TWSg6NXf
--0000000000009c93fe0660bffbe8--
