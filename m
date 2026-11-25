Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605113;
	b=VFdEJWbsSlkiw5c/J+qT1DBH5qhDUlBN12JBoHcEEqDJsa8RZBi3o2xYE2zdc+bhkSOT
	 vIpAUECC/LUggHWH2ikgwoNoUCWas1xtMpotfTLBYZHuBFWEHVqJD+V3Y429ElucMUJ6l
	 GBH7qSaFEp4avCEPVSE4wMMT88ebUOz5Ozg+8NGR96eVWAHOYAozyI8cUYmBRo9U8u4VI
	 gDf+qdHRx7au9XstMDy/kukVx/f/x4nMYg/GILOlFQX5C4ZE6OAEFz7/kUDwUQQYQoAdM
	 bW2DtzIbFQjQWvuItaQMLWFvjGsCpk22ze+zVEHWPmS+0FKuJLVj+i6z0whBrn+LI/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605113;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=UuTuvDKlluUrImVbC6AFcMFB1Zvxmzg42vz1MDByOS0=;
	b=btG5TiRBoHNwj97h4dHzkqeLqrE7yHCft81vFIxtYK9oCcVcRuc7z/zcBPmrXlFWZJpa
	 zkOl+2u2X5z7ZC84ZtHKAzV1wv92YgFa1dl0vr+D9ech0Mqdt0vXAclebbUHn9f1zKbK7
	 UR6RtThpwpZ8vUdvDWU0L6bh0Xru2Wol2SUICG4U8N5fFRVxajXQSgtyPsIxak/P4QShe
	 CvEgP4gFWcvT5pT8wwqTwDoQBYl0rBBKKuz8a6fV4F7XpM3UFd0oHxmqNwuE92ts+vzF6
	 Qck/NtetZIgAYPKHiDWFA+gDAJqcznsGzY7EF4rUZAQiv9VLxfAO+97FnpjG1MX4URg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZcfVYS9A;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363B2606A68E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363B2606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ZcfVYS9A
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cd6acc50b8dso2873022a12.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605106; x=1796209906;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuTuvDKlluUrImVbC6AFcMFB1Zvxmzg42vz1MDByOS0=;
        b=dxMUsbmaH6nD5/7aL/XnICdraVW9uxPXv+b9ZkKTqsSOoZ6iQtOLpxpEwzpluCEo3l
         wmSLiTavQFIz4uU2mbqJw9YnrkwInmtNlbJtVs20eFMtv/w7+son67cgmRR8SwoktTCA
         FaY8oHkyDF9/lMGUBf4jsyKpavrBaCAnTtGdpRFKIexWwVCDt/rkttetkgV3tYonkrGN
         HGpXySgkCu1ScyuRB56oF8UCaJC5ZEyCwVI2Pq5YUBLj7k+f7Mw3JAQQlvjOyJsrkULU
         wnIfVD8m4q1vIrVPuxLU5WxVLx250WZlxQZ7MWhoGhExC17YnJl7q5PzyWG/u7lerNYU
         sMog==
X-Forwarded-Encrypted: i=1; AL+hErGktjWsb6NoI9s1jOWbEdOyv3dFQGfPsiPOD6pwHojfcNghzd+yMhNE7d6MpCeU6tB+C4m7lyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/drqrjMxVw1k75iHbB6Oa+D652HDz6L73Ipehn7PIK9W3z/lvO
	McSyc1i4kl+xDg2U47/vRBIDDt0atQ8niveIKcVjtnCfqSoKqbhPuIKu9yLsEtkcPa/An7vekYN
	h9PmcgGZaTyYo6yB+rB4l5Z9VmK4Gz1Wntkz+tNHUnssn8NtB1sARR/9uua7+ROeKNq3m8G7fWh
	B7IVqCp7SuazGR//aVipChTcbk0VWmaWe9vmhR9deyqFLrn0lm5PqJjq3RKIFInivm1xZpcAu3J
	DpepQOtTDbdtr2yMgk7yA==
X-Gm-Gg: AZFdTZd+nXMYKaWh0CjGvmKv2eRBqSlEYWlWMnnJtnU52FW9gjtSDqoRAuo6nRBaUgv
	HWFOc6MJ4tVGInuYunarLLEIZRMpiE9QYODB7/rO/g1KQx5FLkcTitFP5Vut2l/FdvN2cRgkQf9
	TuHVnszWEovuvE3HxnwoG42/u0yaJWYQUf5gMGqp6rFFdn5znuFWdRZ1BPKJvs+RKEJCU5bPrn4
	6YOC6HoLdg6K3Eo1JKG3pj4rnpFSyoPlpzVMD4LoQaYXkFwFaKZJqVCdVrqJkRdSIoY+bU8W3A0
	1Uaf81EKNz5ymRtmlOZL93peJrkhVKfaJLZ86XHFYTF25A1k9SYiw6lIJLM+VgaY50Z0LRr7RMr
	UNnqOhde9o0I/IwDvmzv4C/v7v70oCdVzm4wCUr+ubg8Wi8t98fhLgMcqJmp0YmTY44F72Q/6wK
	+rANuhYV/Z3wXtvvnFxex/zc7VpQt/buoBm1sO/dClAf3FAQ==
X-Received: by 2002:a17:90b:2e49:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b41c90811fmr16205476a91.25.1795605106381;
        Wed, 25 Nov 2026 03:11:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ae12863sm12833024a91.6.2026.11.25.03.11.45
        for <netdev@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:11:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386c3309469so1833111eec.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795605105; x=1796209905; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuTuvDKlluUrImVbC6AFcMFB1Zvxmzg42vz1MDByOS0=;
        b=ZcfVYS9AWgBxmsm4D1JTSd15SZJA5FdE9n9rE4lN6om0GKQrJ2RUywJRakGtdsSOEJ
         C7f4/prluvn6Q3zW7uyjOiwhQzq6OqWti3a/qaLnICRGhTYq3IokdpaCPJLhUxXhaIB4
         +7saaTtdHENtSKfICnryB2gkHUWAzyV6YEAJ0=
X-Forwarded-Encrypted: i=1; AL+hErHYm8O06EtQQkCPnul7Gz6b7+nFEHobWP/ukOQznTp7rYrDJRmkUy8hkCt4YwBmSqXob1uC8AI=@vger.kernel.org
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id 5a478bee46e88-38570e24c0fmr21471545eec.32.1795605104656;
        Wed, 25 Nov 2026 03:11:44 -0800 (PST)
X-Received: by 2002:a05:7300:1486:b0:383:6eb6:5730 with SMTP id
 5a478bee46e88-38570e24c0fmr21471511eec.32.1795605103887; Wed, 25 Nov 2026
 03:11:43 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124100751.179270-3-ramakrishna.koduri@broadcom.com> <179560146141.3135.3852070914350759699@kernel.org>
In-Reply-To: <179560146141.3135.3852070914350759699@kernel.org>
From: Ramakrishna Koduri <ramakrishna.koduri@broadcom.com>
Date: Wed, 25 Nov 2026 16:41:15 +0530
X-Gm-Features: Aa3M54rFdazOYMtFcfwUi309FpC72BZRtbNUyrBAABwYnwein-8wYx9YRvpn4YU
Message-ID: <CADVpXAcBrorg9-VytaqUgj68mi_MV9qUhhQ0L4pZuYoLiGct9A@mail.gmail.com>
Subject: Re: [PATCH net-next 2/2] bnge: Add support for ethtool -d register dump
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	vsrama-krishna.nemani@broadcom.com, vikas.gupta@broadcom.com, 
	bhargava.marreddy@broadcom.com, ajit.khaparde@broadcom.com, 
	dharmender.garg@broadcom.com, kumar.mudide@broadcom.com
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000744f11066117e45f"

--000000000000744f11066117e45f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I see a valid comment by sashiko in this patch and will send out v2.

Thanks,
Ramakrishna Koduri.

On Wed, Nov 25, 2026 at 3:41=E2=80=AFPM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 3
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] bnge_get_pcie_regs() sets regs->version to 1, 2 or 3 from the
>   PCIe stats size firmware actually returned (`min(resp->pcie_stat_size,=
=E2=80=A6
> - [Low] In bnge_hwrm_dbg_qcaps()
>   (drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c), the comment says=
=E2=80=A6
> - [Low] The commit message lists only the categories of data that are
>   dumped.
> - [Low] In bnge_pcie_reg[]
>   (drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c, line 786),=E2=80=A6
>
> --
>
> bnge: Add support for ethtool -d register dump
>
> This commit adds get_regs and get_regs_len ethtool callbacks to the bnge
> driver. The dump has three parts: PXP registers read through
> HWRM_DBG_READ_DIRECT, PCIe statistics from HWRM_PCIE_QSTATS, and adaptive
> QoS RX/TX MBUF data. It also adds HWRM_DBG_QCAPS discovery at probe time =
and
> reads new capability flags from FUNC_QCAPS.
>
> > Implement get_regs and get_regs_len ethtool callbacks to provide
> > register dump support for the BNGE driver. This includes support
> > for PXP registers, PCIe signal integrity, PCIe Latency Histogram
> > and Adaptive QoS TX/RX MBUF registers.
>
> [Severity: Low]
> Could the commit message describe the dump layout and the version numbers=
?
> Both become visible to userspace once this is merged.
>
> The layout is:
>
> - PXP registers at offset 0
> - PCIe stats at BNGE_PXP_REG_LEN (0x3110)
> - RX MBUF data at 0x3800
> - TX MBUF data at:
>
> #define BNGE_TX_MBUF_REG_OFFSET (BNGE_RX_MBUF_REG_OFFSET + 0x64 + \
>                                  sizeof(struct queue_adptv_qos_rx_info))
>
> What is the 0x64 byte gap between the RX and TX blocks? BNGE_MBUF_REG_LEN
> (0x12c) seems to include it.
>
> regs->version can be anything from 0 to 4, and version 4 does not exist i=
n
> bnxt. The comment in bnge_get_regs() says "Version 4 is required for the
> userspace ethtool decoder". DRV_NAME is "bng_en", though, so ethtool will=
 not
> use its existing bnxt decoder. Is a bng_en decoder available or planned?
>
> The patch also adds a new HWRM_DBG_QCAPS query at probe time, through
> bnge_func_qcaps()->bnge_hwrm_dbg_qcaps(). The commit message doesn't ment=
ion
> this either.
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c b/driver=
s/net/ethernet/broadcom/bnge/bnge_ethtool.c
> > index 2467e44de291a..3ada50832c6d9 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_ethtool.c
>
> [ ... ]
>
> > @@ -740,6 +742,170 @@ static int bnge_set_pauseparam(struct net_device =
*dev,
>
> [ ... ]
>
> > +#define BNGE_PCIE_REG_SIZE(reg)              \
> > +     sizeof_field(struct pcie_ctx_hw_stats_v2, pcie_##reg)
> > +
> > +static const struct bnge_reg_desc bnge_pcie_reg[] =3D {
> > +     { BNGE_PCIE_REG_SIZE(pl_signal_integrity), 8 },
> > +     { sizeof(__le16), 4 }, /* pcie_equalization_time: 4x __le16 */
>
> [Severity: Low]
> Does this entry match the HSI definition? include/linux/bnge/hsi.h declar=
es
> the field as a single 64-bit value, in both pcie_ctx_hw_stats and
> pcie_ctx_hw_stats_v2:
>
>         __le64  pcie_equalization_time;
>
> Every other entry in this table takes its size from the struct through
> BNGE_PCIE_REG_SIZE(). This one hardcodes 2 bytes instead.
>
> The difference shows up on big-endian hosts. Converting four __le16 value=
s
> swaps the bytes inside each 16-bit part but leaves the parts in their
> original order. A single le64_to_cpu() also reverses the order of the par=
ts.
> bnxt_get_regs() converts this field as one u64.
>
> Should the HSI describe the field as __le16[4]? Or should this entry use
> BNGE_PCIE_REG_SIZE(equalization_time) with a count of 1?
>
> > +     { BNGE_PCIE_REG_SIZE(ltssm_histogram[0]), 4 },
> > +     { BNGE_PCIE_REG_SIZE(recovery_histogram), 1 },
> > +     { BNGE_PCIE_REG_SIZE(tl_credit_nph_histogram[0]), 94 },
> > +     { BNGE_PCIE_REG_SIZE(posted_packet_count), 5 },
> > +     { BNGE_PCIE_REG_SIZE(rd_latency_histogram[0]), 14 },
> > +};
>
> [ ... ]
>
> > +static void bnge_get_pcie_regs(struct bnge_dev *bd, struct ethtool_reg=
s *regs,
> > +                            u8 *dst)
> > +{
>
> [ ... ]
>
> > +     len =3D min_t(int, le16_to_cpu(resp->pcie_stat_size),
> > +                 sizeof(struct pcie_ctx_hw_stats_v2));
> > +     if (len <=3D 0)
> > +             goto drop_req;
> > +
> > +     if (len <=3D sizeof(struct pcie_ctx_hw_stats))
> > +             regs->version =3D 1;
> > +     else if (len < sizeof(struct pcie_ctx_hw_stats_v2))
> > +             regs->version =3D 2;
> > +     else
> > +             regs->version =3D 3;
>
> [ ... ]
>
> > +static void bnge_get_regs(struct net_device *dev, struct ethtool_regs =
*regs,
> > +                       void *_p)
> > +{
> > +     struct bnge_net *bn =3D netdev_priv(dev);
> > +     struct bnge_dev *bd =3D bn->bd;
> > +     u8 *p =3D _p;
> > +
> > +     regs->version =3D 0;
> > +
> > +     if (BNGE_NO_FW_ACCESS(bd))
> > +             return;
> > +
> > +     if (!(bd->fw_dbg_cap & DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED=
)) {
> > +             int rc;
> > +
> > +             rc =3D bnge_dbg_hwrm_rd_reg(bd, 0, BNGE_PXP_REG_LEN / 4, =
_p);
> > +             if (rc)
> > +                     netdev_warn(dev, "Failed to read PXP regs: %d\n",=
 rc);
> > +     }
> > +
> > +     if (bd->stats_cap & BNGE_STATS_CAP_PCIE)
> > +             bnge_get_pcie_regs(bd, regs, p + BNGE_PXP_REG_LEN);
> > +
> > +     if (bd->fw_cap & BNGE_FW_CAP_MBUF_DATA) {
> > +             int rc_rx, rc_tx;
>
> [ ... ]
>
> > +             rc_rx =3D bnge_hwrm_rx_mbuf_data(bd,
> > +                                            p + BNGE_RX_MBUF_REG_OFFSE=
T);
> > +             rc_tx =3D bnge_hwrm_tx_mbuf_data(bd,
> > +                                            p + BNGE_TX_MBUF_REG_OFFSE=
T);
> > +             if (!rc_rx || !rc_tx)
> > +                     regs->version =3D 4;
>
> [Severity: Medium]
> Doesn't this assignment throw away the PCIe layout version that
> bnge_get_pcie_regs() just set?
>
> bnge_get_pcie_regs() picks version 1, 2 or 3 from the size firmware retur=
ned
> in resp->pcie_stat_size. That version is the only thing that tells usersp=
ace
> how much of the PCIe region holds real data.
>
> If BNGE_FW_CAP_MBUF_DATA is set and either MBUF query succeeds, the versi=
on
> becomes 4. That happens in all of these cases:
>
> - the PCIe stats were v1 sized
> - the PCIe stats were v2 sized or full v2
> - HWRM_PCIE_QSTATS failed
> - PCIe stats were never queried because BNGE_STATS_CAP_PCIE isn't set
>
> The ethtool core zero-fills the buffer. A decoder that sees version 4 wou=
ld
> treat the unwritten tail as real TL credit and latency histogram values.
> bnxt_get_regs() uses the same 1/2/3 scheme but never overwrites it.
>
> A related point: when bnge_dbg_hwrm_rd_reg() fails, the only sign is the
> netdev_warn() above. The zeroed 0x3110 byte PXP region is still reported =
as
> register contents, and neither version nor len tells userspace about the
> failure. bnxt behaves the same way today.
>
> > +     }
> > +}
>
> [ ... ]
>
> > diff --git a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c b/drive=
rs/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
> > index 227de771f2ef6..9b8cb39dbe164 100644
> > --- a/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
> > +++ b/drivers/net/ethernet/broadcom/bnge/bnge_hwrm_lib.c
>
> [ ... ]
>
> > @@ -597,12 +598,45 @@ int bnge_hwrm_func_resc_qcaps(struct bnge_dev *bd=
)
> >       return rc;
> >  }
> >
> > +void bnge_hwrm_dbg_qcaps(struct bnge_dev *bd)
> > +{
> > +     struct hwrm_dbg_qcaps_output *resp;
> > +     struct hwrm_dbg_qcaps_input *req;
> > +     int rc;
> > +
> > +     bd->fw_dbg_cap =3D 0;
> > +     if (!(bd->fw_cap & BNGE_FW_CAP_DBG_QCAPS))
> > +             return;
> > +
> > +     /* Discovery failure is treated as restricted so we never attempt
> > +      * direct register reads without confirmation from firmware.
> > +      */
>
> [Severity: Low]
> Does the early return above match this comment? If firmware doesn't adver=
tise
> FUNC_QCAPS_RESP_FLAGS_DBG_QCAPS_CMD_SUPPORTED, fw_dbg_cap stays 0.
> bnge_get_regs() only checks the restricted bit:
>
>         if (!(bd->fw_dbg_cap & DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED=
)) {
>                 ...
>                 rc =3D bnge_dbg_hwrm_rd_reg(bd, 0, BNGE_PXP_REG_LEN / 4, =
_p);
>
> So HWRM_DBG_READ_DIRECT is sent for 0xc44 words in exactly the case where
> firmware has confirmed the least. If firmware rejects the request, every
> ethtool -d logs "Failed to read PXP regs".
>
> bnxt_hwrm_dbg_qcaps() also treats missing DBG_QCAPS as unrestricted. Shou=
ld
> the comment be changed to match? Or should this branch also set
> DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRICTED?
>
> > +     rc =3D bnge_hwrm_req_init(bd, req, HWRM_DBG_QCAPS);
> > +     if (rc) {
> > +             bd->fw_dbg_cap =3D DBG_QCAPS_RESP_FLAGS_REG_ACCESS_RESTRI=
CTED;
> > +             return;
> > +     }
>
> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261124100751.179270-1-ramakrishna.koduri%40broadcom.com

pw-bot: cr

--000000000000744f11066117e45f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGpzCCBI+g
AwIBAgIMa38EXfcgBQ4ZhynNMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYxOTA3NTQyMFoXDTI3MDYyMDA3NTQyMFowgekxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEPMA0GA1UEBBMGS29kdXJpMRQwEgYDVQQqEwtSYW1ha3Jpc2huYTEWMBQGA1UEChMNQlJP
QURDT00gSU5DLjEoMCYGA1UEAwwfcmFtYWtyaXNobmEua29kdXJpQGJyb2FkY29tLmNvbTEuMCwG
CSqGSIb3DQEJARYfcmFtYWtyaXNobmEua29kdXJpQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAL0BDfHMx7H8DhVwJ/DCrrWrFdde0ZEVhCDABth58CcjCf4IK7kK
lkygTyAQBB9kL+GUoIK31C8vWthA+Ou9LtfDPFm4loAjeSFPGNaLKXf0ED0rJP0i8alYYzH0zk5n
KYu8LfPYeAkf5hqZ48ZRoVdVzblCQSdPlc+Qja+9u9ZtKF/iP+tquVZfmsC0Og+AAkiXUsazqOYi
d2I5h7IqxWIHEUrk2vgz3tbtEvSASDRM/af/1u3m1cUY6ZDbwTV7wLCkYEEvl5Wzw9p4ekEjJv5a
5gDudlO4gZ24JUqR5VYpAfb3AOCgkcyg7C02rzffwHgTNf9c5xKpRJHKMv2iwf0CAwEAAaOCAeMw
ggHfMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggr
BgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1l
Y2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2Ny
NnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGg
MgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5
LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKgYDVR0RBCMwIYEfcmFtYWtyaXNobmEua29kdXJpQGJyb2FkY29tLmNvbTAT
BgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNV
HQ4EFgQU9g9Oo+bNJD4SZwPoLXspwvgyvr8wDQYJKoZIhvcNAQELBQADggIBAIecRRqebNMJ4d7H
7cAR02jArJx9pL8fPfEO0VLjEKgEtyPd+LnzVGS8M6wSZPKfBgZjewZquAPW/Nu5QbVy20ictvQo
NrcVS7pQxUQqyZ7ygxxyrgcKA70SlGwKiE6av7oO9/5uC76eT449EjnhYqkKM/NNnON3jyIZZGgm
jGAM353u1cpJLcne3fjaYxdpwIjWq8LjOQiArNN/Oss5wkL+Jm3r5r0VKZJ9uoGKYzYNQSLjRBGv
dBgaodLlBhU/mGzICgccmmp0CA4b91FsKDHxjw2/7cxGBCd27Vg/ckt41+3IXpIy8khBLlEiWxrg
320ZAOQhiBI1of7pD74VjZFctfX8KDNIqNbVuz+r8yzdzsxf9KQWkLklTlSn4KJKsF8OXVHP6B2S
E6qPU/2vuvsYIYLz6pVQNJ2WU+C5RiHhR9Aw94QqTQVeqTP8in6etwPQZxYpgH218jpHT9G1JifJ
/lClaLGe1WZN3yaqOnL/J0sbMwmqIOJ/K9jR0W90v3J20DxlNvzezqr65c3hpq9CaTIQK5Bw9E3J
+kDmDdMucUkLs+TXMVtttFp59CxL/++SroNuwArWExEL8K07/gSVsvJ8kscoeNLH44YJRZHMnQGW
48IAnqWB5QHi+fJ/N96/Z3PgSmAgB21KPYkxPyJ6zswxdk8YIn77ub9hspo5MYICVzCCAlMCAQEw
YjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xv
YmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMa38EXfcgBQ4ZhynNMA0GCWCGSAFlAwQCAQUA
oIHHMC8GCSqGSIb3DQEJBDEiBCDyEaOHsPQqOW60PK0UYwrmhWbPrJLKLaUlLNjW8H3zFDAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjExMjUxMTExNDVaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA8v8tx7KQm
OVum2qnUlm0Rg68zv+9L6DjA7bMSkKroDevfxQyyctDlyD8+gvWilPp1GcsIK0HlzWJe+LHqY0H2
bntAVDlgtR15MURp8DB8spGAUYOs/XfgFZPHw2pnTor4ivvJp9E2bYCP1vso9CMni/XSaXRxU9P5
Ex7lvATfITDhGXSXERSCVUMTb7ZyxBGCoG1v9EBFf2Seh/vlANIKWXYq+X9RuU5uzl8ySTz6Xcve
bOz21j/IPGwt8iEEThqCNQriUW9ZHIGEjjAMER6MCaOx1YcOWUwmLMoR6aJMHfkF9M6DpDr5xrab
GKrYPAkWKDi58vmf/pfwzC68Bi4E
--000000000000744f11066117e45f--
