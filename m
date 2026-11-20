Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.202
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795177092;
	b=D08xEQndVh8sNIobh257cc/1CSq+Ns4Hned/Hb0Hkkxq46KWrsKDKRaoSvHJjGw5V5aQ
	 YsuTARnK9MSMfE6YwCCv/idfd3BZzV4Qewh0IQIu3w0nGc/S8OFoCswE/uTmJtxcCEgsq
	 ney5f6jaB5ccM7aVLuIWopZHS9EgXZ4Ho5HFpJv50vLib3+VjA1oXqrCecmpSQJJsa3Mv
	 OcXT3j1vuC8hT844fjNYcdxCw3Usc6M6bSTVA9XRNLZEap24zaaEars1PKG/cLuSyiRpy
	 D/HRx2cx8HQgb1eae8CbQYJd/23bVJWrugX6L6nXdIQmX7ONmv3Ncvy7vczdw24Q5nQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795177092;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=YjJw8wdPh4kC1FRbv810ZEoULKssDRVyje8LjZOXafE=;
	b=q095UMPZlNd7ABTvM3VvUIEIHDhkCTdmp+UklvqxAz5UMLVK2cojRiQcGTlm/ODBzAPR
	 CMJ90FP+3vU/JKgzHjRrwEDiHS85uVrrVnn8Y1liKTdH9VozKn4Dtm8Pf1Kc8pEK6KOSz
	 RCs4wD0tOF8mFjB5FfnAI7yIRQvE9paAK1gSohu8RYL1oe5gwMDtC+814Opil8+S08aGs
	 fq1pcuhwFLVCGhvGABmciopXLIJ1z2RHm8WeAW0LGm/C+m6q4NrbEyRVU7WF1wwn4DWsX
	 vqeAjN0XZZkPamiObB3MX895T3guCSy9C2zw4oqDzOq5/6UB0hozkDp7PTa5viJ+FKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ICbNmqex;
	arc=none smtp.remote-ip=203.205.221.202
Received: from out203-205-221-202.mail.qq.com (out203-205-221-202.mail.qq.com [203.205.221.202])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040EB606A32A
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 12:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 040EB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ICbNmqex
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795177083; bh=YjJw8wdPh4kC1FRbv810ZEoULKssDRVyje8LjZOXafE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ICbNmqexrCGClx4gUFoZSx79G8KEuflFvTC911PhneU5BqZnlh2R0DUUEtTt23eqg
	 U+5e7gB14LD8xa+pxnM1he7EdUnv6T8mkwX1SHBafjGhnTZWsbRCguCw1KV2z9CEP2
	 Fx+n/ZVwSlh9oeDoGFDMD2hpt/amzofkrQF6BKjA=
Received: from [127.0.0.1] ([2409:8d5c:8f0:65e5:65c9:1ea4:b234:d5d4])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id 4809386E; Fri, 20 Nov 2026 20:18:00 +0800
X-QQ-mid: xmsmtpt1795177080t2caxcwhq
Message-ID: <tencent_D8ED43895D9ED0905ABFCAD3F7CA5A2E9009@qq.com>
X-QQ-XMAILINFO: MqswyhUqVe0Ck2MAbHYdhvjeLeMcDyAaaLgiFI6Bs6U1CraXb1wCgahYMh9hrl
	 4k+wIx4I/3D+sO6wVoF4snciT8umKUklmk1vzOAfgREATmq4pVr522mBqcB2X6bc5THgPqDRmjfJ
	 e8naRuN2sbUTOTdXC06dlQaEL8g0sDzRyqaAuafK3yP36i6mLnUQxGll92EpOMXw+YdkQ16zkMTQ
	 8qG/mQOwuE2xc+3Y9dUg95vE1/sTw/HCYwgZjesH5bemckrTsTtSuaRgRnTCAiaPYt8iskGSfwg0
	 mLfPy8Oc9g7zzM8cq13LgYQ3VoKb5Cit9ITAhuuH5+n3zQqG8GQxH46L9LdpYnSvUq10QtRu8erq
	 2BeBl1qOwPoQkB12FSxp7/UI4dtvz/nqeLsqIAM2xo3DpEv58BF1dOdpdGztUFwrDZQSGdlZWpyt
	 qPipgttjnxG3SSKV3xxLC1wfscgdioKk+4dSkE8M2OhdFX3hnxAIj3/42ODwwliUrEcQXWFdedBy
	 nSc46svWzp5o2C6ClEEvIuJ5F4fefDXxU94sRM/M6AmjuPh3WBWV9+eUiz2Puol09n3RPO/AnNLc
	 v6kf5HlvghJg5ja1yAMk1g9lut2L44K4MfVTdYdXB3TMBhYjnJ/Wn8TPmOeIkDaa7mdJqP04DYAP
	 MEPDHgEpCuDxj1au0DTONgh6HxO3ptqbFVJg1sjoiEQwME0I4T7DjBJvhZiS5hwvpUQ1S4YQsRfx
	 UFxCB0BoVXCmDOIw34zyqNOvm6Dnmr7R2sfkpSnqfcBC+MMuol4VoBJyoMsQFfxibKoXzNqvL1Ge
	 2/VXOJM4Vn6iKk3WoRxsoNvjTGrHH3ku4M8hxWfIAQEu9I2fdyynZAlcYNmGmlXvS14iYaEeiFfO
	 LW6lDwBNGk+x4xyhl73/h/cslEA4bfiup3EcA175BbRLz3ll+wxBMNMWqVcOruqT3y/FhB8tU22d
	 io2Nu0QPJkYeNB1GGlxAQnSZFnfSs9sbKeHxYK6mwAMUXxhkpoMb6w3kGav2+/uwSBcnc8rEn7de
	 AvkwbjGsUAcOsoQb4ubVVti1szr0KGlp3A7poegQcDVqydAX8kX9L8eK6k4UMBqqH8X9EXyHi40N
	 0TcgCVIGODKcdOdMY=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Hang Nan <2122295973@qq.com>
To: lkp@intel.com
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
 mptcp@lists.linux.dev, 2122295973@qq.com
Subject:
 Re: [PATCH net v5 2/3] net: mptcp: reject token 0 in mptcp_token_get_sock()
Date: Fri, 20 Nov 2026 20:18:00 +0800
X-OQ-MSGID: <179517708044.56979.7846748995584448352@qq.com>
In-Reply-To: <20261116145829.96849-3-2122295973@qq.com>
References: <20261116145829.96849-3-2122295973@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thanks for the report.

The undefined symbol comes from the KUnit case that v5 added for the token 0
guard: it used mptcp_token_exists() to detect whether the socket it had
built was reachable from the bucket it expected, and that function is not
exported, so mptcp_token_test.ko fails at modpost whenever
CONFIG_MPTCP_KUNIT_TEST=m with CONFIG_MPTCP=y.  My local runs had the test
built in, which is why I missed it - sorry about that.

I am dropping the case in the next version rather than exporting the
symbol: a test for a !token guard is not worth either the lines or a new
export, and that also matches the maintainer's comment on the series.
Without the case, the only mptcp token symbols the test file references
are mptcp_token_{get_sock,new_request,new_connect,accept,destroy,
destroy_request}, all of which are EXPORT_SYMBOL_GPL in
net/mptcp/token.c, so that config should link again.

No separate patch is needed for this; it will be fixed in the next
revision, which I will hold until Netdev Sashiko has finished as
requested.

