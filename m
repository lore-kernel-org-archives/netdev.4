Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795599846;
	b=IyJhPUS7hiPE3nCvx3JjAhWfxN3p1VVDF6cDfchlFMqH/Yi84zNahNGwbDWiJdNv5r3b
	 5b3DMHYbC5XxvBQMWekzRxpHIro+M4BhafnF87DJIs469pDUJ3cYx5hJYdvkcoF4IEY9r
	 I6SRckeBnDHA8rm5V6s0YIfAXZ7HbcVOuB86Vm28uGHqlI2Z9GdnGSE2//sa5U4VSh7Ts
	 jHZ7bP8ZEZEDh0nGaiXm8ZIwrqEe58+J5BANkynOTj0JS+sG2K3dfaxcjwXCQFS6XNnIc
	 Mo65e25U5LHb+ygpKyrvH4WgJRaFtFJlKs6EXO9t2ulrGE/u/9GC6yskStA2+qGDJ8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599846;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=EUq3l0cL1Vkwxf7vKGtZYzbcN/Dl7f21vDMrNhol36Q=;
	b=LXfbyNRhGVyhnYjRi/QfG9dyaYsZssSf55yGSaTeQgB19AdeEmbQj13wieeGzyv3saqS
	 xpGFPU30es8uTcBVEV25QMifsAhBUGpCoDTMp6NPu0meY7KVaDfiPt/d9XgRcnoPyiVV7
	 lASecQfBd6/ABxk2LYa4TDZ/x2lB8oqh7G2R3EJeYE+P+yNqqKdUmhjKDjHJfmODXIOE+
	 /JwpVta0PUYq5dzYDfYBPL8iNBH90XCLL1Ne5B7lQN/v8tAmLCD2DDbXmKfDlHqMg4RuC
	 V6DJBLDxpONaqepsdzqmBrjt+d1BikwwxTTiUnKyd28h1qHEzT3R8VZH9kXTlYIXBNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RBuaSnpI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.50
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013050.outbound.protection.outlook.com [40.107.159.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CAE606A31E;
	Wed, 25 Nov 2026 09:44:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3CAE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=RBuaSnpI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5YPWLeBvRD5rcQXjQTdcAFIwxcaceD2KXcmlGJHgQepnxxvZED/Ep900gVlRqd4nTaj4pYL/+c1YfBvD4HZkkeUlhGf54rPOfGf9m0RmWPPRof8POONn6N0PlhF4TP/H9Xo/6hbtb0LYOqyJpiR6k503+OnGTBxc3O+bzNl+RA1rSPuTcRky8URCZzNKbBLSpF3TN2EpKf9ewmSuYN9Kchhqjo8EwZoLFG3+BWKvXysQPzs+xXQidgeDxuMENQPxC8eMEhZqcS6Vvymj8la6QNPKcbeM4Jq+XUo9+4XiINR3yZ4JB9DculS3VR2x26lW2WDf/iz9yx4J7wQ+af3RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUq3l0cL1Vkwxf7vKGtZYzbcN/Dl7f21vDMrNhol36Q=;
 b=f2szVO9f6nIVe4tdSgVrUhtHSx4pAf3p31X+7j1C4DjCuilOCRAetjBKgaaobckkod7ga+AhmQBNVC+EHO2F1CF+Mo4K7JXYLmDFiaKUBcact9M/YHITV1n1/OfGIschVOkyKb7l1ht2/0kOaxk/XrbmBOdipn1YkgIYqKgc5Rxjg+wKAVGDYaQ3OhN+fBNSbFgYE2VIh0Thy6X+tHQnVRJ2q/KoUao2IGUFs2UrmSgVgHNRwRpfxNlzaWuzfIkWTd/d3PwPPQ79BkDE2DUFQ3oqO5BaTMwMypi+Fbsa3oRlaGkhBDnU/AlVInbnePn93qurz2CK+a6UN8Qi2vkFwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUq3l0cL1Vkwxf7vKGtZYzbcN/Dl7f21vDMrNhol36Q=;
 b=RBuaSnpIucdaboKhB1yIxTwTnYhMoFw5rZGnoJWxn9dhOGs3OUtSTW14OrkOgTOTvsMTQbUj5Qd/Y3iGUqN8W5wh+wAsx9wgAFtzsL/9XJFUy2GO4Tr+F+YtTF+1Vhl9dk2cGRVa0jGhTvIVNrVH3Lpyr+j4gyCNROInJHH3PKFcUGxpbq+DYeKURtsWnHqlZqJ9OWq6nLrMQIswZnrbj3LnIzWOZTYHTlXy9TztVfBYK3tMobtST+v9zXGpTUq1hQBUUMBYQ4Qw4KAOI7ybqh7xJDjNlGCpp9aABMlv4m6uYcQkKx+e2G2ZUk27kCs0yS2079bSbUfkwrN1jaOa8w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB6902.eurprd04.prod.outlook.com (2603:10a6:20b:107::20)
 by VI2PR04MB11194.eurprd04.prod.outlook.com (2603:10a6:800:291::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 09:43:54 +0000
Received: from AM7PR04MB6902.eurprd04.prod.outlook.com
 ([fe80::6d09:9d2a:f8c2:25e6]) by AM7PR04MB6902.eurprd04.prod.outlook.com
 ([fe80::6d09:9d2a:f8c2:25e6%4]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 09:43:54 +0000
Date: Wed, 25 Nov 2026 11:43:51 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: javen <javen_xu@realsil.com.cn>
Cc: andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	nb@tipi-net.de, maxime.chevallier@bootlin.com, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, daniel@makrotopia.org
Subject: Re: [PATCH net-next v4 3/3] net: phy: realtek: add hardware
 timestamping for RTL8127a
Message-ID: <awathfkR13ZQH6g9@lxl00025.wbi.nxp.com>
References: <20261125090217.1198-1-javen_xu@realsil.com.cn>
 <20261125090217.1198-1-javen_xu@realsil.com.cn>
 <20261125090217.1198-4-javen_xu@realsil.com.cn>
 <20261125090217.1198-4-javen_xu@realsil.com.cn>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261125090217.1198-4-javen_xu@realsil.com.cn>
 <20261125090217.1198-4-javen_xu@realsil.com.cn>
X-ClientProxiedBy: FR4P281CA0388.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::17) To AM7PR04MB6902.eurprd04.prod.outlook.com
 (2603:10a6:20b:107::20)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB6902:EE_|VI2PR04MB11194:EE_
X-MS-Office365-Filtering-Correlation-Id: cdd3eb09-3d60-41c6-4a3d-08df4ad89eac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|23010399003|7416014|376014|10067099003|18002099003|22082099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	4lhw6bdgGJqNeR/t+awffLIr/tDG+Nux9r/O8Cw8zs1hEV+7ZDPe2ho0ZKQeiGiNbaf7Bob7gtmZpq3qtOxOolOtpza2iI73JxtOf8Eo4sVueqhiUFf7vRmsxVuCtY3if1mOuK53k1TQgtPQbLnfyR50X8JHHxkcMQk/NkjJbuMObFcrnFnP7i7L4edWZaBp73NyUfzEI19Gxui+OBKE1rGqoxws+14W4HDW8ZM90vmP7yPkL4uWKYc1g/h0KWFPcny6TgqrWejnCZS5fCANW0rrhHCRUKQmeBv2CyLgZGRlYfx8wXpOO9mLgWndnbHDnPHBtpYXuvqnwh3IWAQQM00ShZghmJjkcDzoBONFYm8NiSPSE3clJim0RQPdpeDLNCitZvF0AHjG+wbe2toBDYydN3bmGL9RlRfqHlTFflyicrionX/HfqsQBn030MY+/vIw6w7j0kdeimt/4JM+dZXIlEr1X1KXadmvFWUR0GIQE/0VdsrW0wuGP3Zx56l21/qNUKh0ASuPzJpDhtkbpXCg5EBBi4tOW8KSjbc/VdlzdrLBC7v4or3eYuIvwXPYfpH7HIrJWDyhqKLMKLD0Bos0JM9HIZqybv3b7MTaQOxzQsk5VUjKWukBJNKjMVDa8D5nvKwqnqJ+WeGdshHT2Jg1BA1cblc1LmOu1Y0MHmc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB6902.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(23010399003)(7416014)(376014)(10067099003)(18002099003)(22082099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A4vPpggJZA2ipnTk+IBqwkGWEWou9cwFyLcIXAJngNTc8Xc+6P0xFcb2Fmyg?=
 =?us-ascii?Q?b8BKQRFqeV7KB/pmPAqNL/VZPh+UVitep8jLPi4iM/2oUBTJ9gZnEPBipGP6?=
 =?us-ascii?Q?brXN/qZUpnyJ1p5C/Cu1uuygIY4oYk2Lk0bMdWcF+xK2zwqWLWvcQtvYK4mX?=
 =?us-ascii?Q?emOZetrX7MNGEN/BMEpwXHPW0jBXE5IXfFmi3vlo1DEEjV4VigTKpDOUO8Yp?=
 =?us-ascii?Q?I4qIwPoqJnQwOcVuo20QOGFLaYUlAoq4s5VraZ3qgdE2ZCQdFH9ukOk6dO6b?=
 =?us-ascii?Q?TZK1v89++qF5T0tA77FAhd3ZDZthw3NvZc0acszk93tPilFBOba1YEHHMwjz?=
 =?us-ascii?Q?5avwXi0M9BdlR5P5z/BbvU1gb42LeEmvuZlII2y6XKuIucJ4ZPmQ9PfZfmIF?=
 =?us-ascii?Q?abTaXsb7gFc4ALC0Ojku0zvWH75y/t8HnKr3sUc6wJkrtObB9hu31a04p9nK?=
 =?us-ascii?Q?tg0TzbPIqEq4P+RZoUnFjwJMmUCeMzcB7S7RqWQLQtgcsTX1f+rr1xH/dVY2?=
 =?us-ascii?Q?VZgw8WZ9cUPVoLAuvnBiGlKFzRgZibAAFx05v/ek7LYfZdzM+1Q3WhTgxMKd?=
 =?us-ascii?Q?QoC5F7ykowHyxKjPQOj/ygQ2dltClo2bepo6fposDKnmyRGApOGCO8NMh96t?=
 =?us-ascii?Q?nFQglH+tltQlqMh5OLd7q9JTBbEB4gxeSd2wSVsK29ukg95mfCKsaDZdT+pG?=
 =?us-ascii?Q?u+NNcUsQ3P5hUibhiiyiVQWOa7VW+p3xPimW6/Vz9kDAvXtK/Vr/K7nOTRy3?=
 =?us-ascii?Q?rPwk4r5MhDSr8BQHFdrS23TktFbcYbcK+YV17Fb/1hz/kUbayL/IvgtFtQTa?=
 =?us-ascii?Q?qlrCBuasjod86Fn/rpW2QUv7XFGbhv3E6Y7Y95JZW37bRLZrT4IHc38BAcfl?=
 =?us-ascii?Q?wg39duPP121Yg1Q/ULut7N+cCyv0qUUWzcr8nDU+jQhl5+3Fy2Aai+I0ey5q?=
 =?us-ascii?Q?wX57B7k61+16Yr+oS5SxDlQ5EWrjNoAGIFU321+IEhrG88VfUAJx9ko80702?=
 =?us-ascii?Q?CQHVlricgqgKEDd3/RjNK9nAniqsyqyNhsgbo3MngfYNUK3F/JL0kqqhT2px?=
 =?us-ascii?Q?7gfwV7mA5PiMrwDbMNgUkQcSyeDhJAgAIIN0n5+i6V5/yX8ZdGh6g+c+aIs/?=
 =?us-ascii?Q?jKRJkbwcr91rUJOrlQU6ytr68S5CcvVC+hykRL1pjBp4pCvi1miV8gV2PWqN?=
 =?us-ascii?Q?dzyxYflXJoX7vQR/ISzxJYpuKGSoeHiLsmp0Xf/EREb3huCimCwAae1O0WVg?=
 =?us-ascii?Q?ccwc/oOVD66voi+sRqD+ot76qX/MOUbmnZEI0fmZgbvIKG9Zhcy6/Vc5uE0f?=
 =?us-ascii?Q?aUNqqSxvDs5GkG05Q5gDYKWWWMsSoLl8aKiwEJSzWcZrh1fVM22dylW9Oge7?=
 =?us-ascii?Q?AxvZzsb7zimkWwr9bzggXHFUHj7JCoCm6vAebP3a7VvHAJ0d9F7rLDaKb0Hm?=
 =?us-ascii?Q?tBKB5N30CwnTDTHG6g53BexYT9/dUxaLP/85+qqfsdrOywp8ANHlZ1BnqgnV?=
 =?us-ascii?Q?gBhyoALzGTEpJhD6P6Jw2Z5MtfJthXoSp28vmzzp2/6LZEegY36KQF8eBion?=
 =?us-ascii?Q?nA6+FXeraMaBIqzQEfMakG3n9CmsI6XP1zMmN7cBedjdkZpWaiT2RLVqnaU4?=
 =?us-ascii?Q?j5pEQL+T0Zl1DX2DC0C/9yLYC0pwTwPaU1lEiiQlslZkJaXkxbW6HA6sDVD5?=
 =?us-ascii?Q?5i6m6DNkGUxwY7ozrdac3ft4nFyjJ9vJxfQPXh4wrmxGH0uL3ZXRHcPpLlwa?=
 =?us-ascii?Q?uInrSYoQ+g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdd3eb09-3d60-41c6-4a3d-08df4ad89eac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB6902.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 09:43:54.7298
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HCg+zHxHavjQ6hhxlPqWrU1S46hfkeJsK7rYK4zT0rC8aBwiGweH7uZS6LfZYY/OYctV9kBfUkbBNMbY4/yQ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11194

On Wed, Nov 25, 2026 at 05:02:16PM +0800, javen wrote:
> +	phydev->default_timestamp = true;

Enabling new instances of phydev->default_timestamp is not an option
that you have. Did you research why it exists?
