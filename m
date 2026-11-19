Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.107
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795092442;
	b=K2KMdf0tFMkg64CLgsDQ3H/07arVXIfUDs9uY+cKrDJjTRBp/kgeeZfwtD1Y71gfvB0y
	 K9rylmB0QqRYzX1/IRnN6w+csOhl4PE0Yl0yhMTrlLEaDZqITlwOC3VrrGobLqUs8bXR8
	 zHvMPm2mtavONIhqy7CkdYgdUAW4obIY4IMp0Ymu1ama6c2xUfnpHI5X/vBXJ3R63kCFN
	 eTmp0fxJcOJ/ouf8nMRbOFjp3F1QDPh3no1fbKREA1UIPoUrntu6+RM2B7KsSorrCbpOo
	 KIIiOBFkq2AK6VIWkJguJdBDn8kXOJn5pyytSP/kp74kQO7r8DT+taC3gPz8zPFRq9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092442;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:msip_labels:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=TeQUEhnlMxVkWSKTG0ojbFpVByh2uMF8F6VDzl5LR5Y=;
	b=x8a9LReJX8i2C5nVmlAqTIkkwooTzWO9Vzwy7/4uGw3+EwRbK+ulA6Qyo6CVfP4WAlSc
	 //g5mYt6aGnr6R7FnKxPAobfSWsZ8eazsbkjIrks0qfdoJSm9+gAiMAJBZmReTqJSA7a9
	 NTPnYl9pvA6it+SA4/75edc8XnisK52k/G7KL8JOJues36vLbKWmo9ZuL7igXT0c8N9ZP
	 FDTrW4zaWkIxQXd9BXrOIA2spZDeUaGNBQJ1xSVrUVOwMuPX6Awv7ARjYDGRnBFWZlQm9
	 MN9W8pgkdVKSliR0kiUywl+hXXCA2nOa2aWo6lQniCtntb0FPekpIp+Xzjq09yjsrxA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=netinsight.net;
	spf=pass smtp.mailfrom=netinsight.net;
	dkim=pass header.d=netinsight.net header.i=@netinsight.net header.a=rsa-sha256 header.s=selector1 header.b=baf2I21c;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.107
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11020107.outbound.protection.outlook.com [52.101.46.107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ABC4606A320;
	Thu, 19 Nov 2026 12:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ABC4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=netinsight.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netinsight.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=netinsight.net header.i=@netinsight.net header.a=rsa-sha256 header.s=selector1 header.b=baf2I21c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+A4LU++xLXwZprCFBlDlDVu5YSEU2k61vjvv0fjBhbniQaFBipJNn1FBi2uh+Jyhr1xfxm0xohn0r/cjcArIu98g+UU8AYXPdZoZR3GNJwwZxMlpwn3kYe06Jx20gD+B/rd7bP218iRvmJivVOEr0zEGNeXGoBAq+oy33sdGz+sagd3qT5K8o3Ph6Unw6XN3GebYVLK+4UDcd5VuLOeYgjUoqI2Noxgjc80j8fUAXixQC5WdHobHZPIKRgVOong9IYl6fWdDArLTugsuLgMeSK6nHmpBwG/+r/6CNqESoQpZYAVuzyd6B9YxLUQngmV1iS+L8DEHgO+uzii+zgpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TeQUEhnlMxVkWSKTG0ojbFpVByh2uMF8F6VDzl5LR5Y=;
 b=uLPAdy5D5/wduGASj7bM9TLvhTGbTb0mxmUsczkU0jJOH0IKrsPreli2YTgXGKN9wEtX5WyGistbSzlJ76ldeKvFU574rDedGIl0u/KpaAFal7FNW3QqWXKSmyt4tmgRB4MbOKCoJK18cfuoRN1/1EVL+D4Z3wSX0jRk1JnxSUtrTDnax4kxGIibhbyxZuYUcidKbIM3N01UTh+IJNwk4daVZ7j4BiFVBVDpCHuR2lYcjVKn1E9AXmc7MIYCozExySQ1ok44rvtq2Nn6u/HCl53tH79jpr1oJTluKAwZND2zQUNhtmCKRRbeno5B3Xf5ncHIMa5AFGODqu1thxkpRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=netinsight.net; dmarc=pass action=none
 header.from=netinsight.net; dkim=pass header.d=netinsight.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netinsight.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TeQUEhnlMxVkWSKTG0ojbFpVByh2uMF8F6VDzl5LR5Y=;
 b=baf2I21cGELXLRneR/LAnfV0KrEI2CkT4kCb5qeXFhbNzp/Ew1AxnurKhuUMtWP6GtB8NeYaJLXHfQgjsAykvj62UITFFXYW/OM6D3fh0m0IyyrU7LChp7+eYGJBpYxxeYfrwA2HsWvGxCAwXJ+QIJlm8lAPGDRN+te5KoiV7VWR9m2GE9vgjL13d6zvE1KSy4rJt1QvwWpQWZQEyzJamKhR5MYHnGySQk+ehuT8KXWoQxuRS7gh7gBxlI5i0JhLuU7vHsweF2d9ntSK3RkeTsUcRUN6ly0CGLWvAT8nTOI+0NcahLcqDhYBcX8zzEWlpfRIQhXomPAScbT7GFbD7w==
Received: from IA0PR17MB6687.namprd17.prod.outlook.com (2603:10b6:208:40f::9)
 by PH0PR17MB7598.namprd17.prod.outlook.com (2603:10b6:510:383::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 12:47:18 +0000
Received: from IA0PR17MB6687.namprd17.prod.outlook.com
 ([fe80::14fc:a86a:d2a9:4703]) by IA0PR17MB6687.namprd17.prod.outlook.com
 ([fe80::14fc:a86a:d2a9:4703%4]) with mapi id 15.21.0615.009; Thu, 19 Nov 2026
 12:47:18 +0000
From: Roland Waltersson <roland.waltersson@netinsight.net>
To: Francois Romieu <romieu@fr.zoreil.com>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>
CC: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kai-Heng Feng
	<kai.heng.feng@canonical.com>, "Rafael J. Wysocki"
	<rafael.j.wysocki@intel.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: [PATCH net] net: via-velocity: Stop the device on shutdown
Thread-Topic: [PATCH net] net: via-velocity: Stop the device on shutdown
Thread-Index: AQHdeCCB4hEHwBAEf06IoP/3DJiqWA==
Date: Thu, 19 Nov 2026 12:47:17 +0000
Message-ID:
 <IA0PR17MB668711363A5BE04D1BC3C76B9E792@IA0PR17MB6687.namprd17.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=netinsight.net;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR17MB6687:EE_|PH0PR17MB7598:EE_
x-ms-office365-filtering-correlation-id: 98ed90e3-1023-47d9-c42d-08df463b3ec9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|38070700021|10067099003|5023799004|56012099006|11063799006|261026140227099003|261028144727099003|261021121427099003|261022105027099003|261026121527099003|261102123227099003|261009223027099003|18002099003|6133799003;
x-microsoft-antispam-message-info:
 mG0Z+AY3FW3tzRGYmuBhL/eI41XL/AMnWUIMOtiA9CPS5xF6eS1H8koB5rZejnNhC5SbYRF1q1PDTJAL6oAW9B5xtwaXNK/cgoGvo8w0/q/5mUqvI46x5VyxVrSuhPHPHqRnM0IUW1BeDy56EDN1rBFK6zQ22tuk2WPEatn+z1ykaYLW+qjW0KkOITSWcT78FvGK+Rz59KqPdCxGgafUsWPuRU0DmovXSm5kBhKTc0rxAej17jhFCwtcvwoM1UP6lYLdwEihwsIp0g5K8JVIx4KUiJd3br4mjmAqtb2ND4hDDZA/irB5vnJvvqY5Ag3TwFiAHeHlvKh5XQBTObQb1Ga//FB3GLcyj0nRBexZ/+PwtyvnBOrUHeVjWTxCSrWOcO8bX7iwBSAF+eAVKWLJnnQaYyKjbrSlU9Bpqo8Hcb7qP6YNH92fzHMevr4RtLflkm11drvYWZDiNnj1Vi7nhXOxvh/AaIRkzjK398W4SFfnZDl9wN98STTrvxCK/1SxjzmduGVrmi28Qk8uxQG60Z2IvelrBZUAxUCHikXvj6bWrY5YhinP+k/XTPTilv0M0t7uRLxfPfSOSZKlalADbBJ8LuiRjhuEFYap+TljZNFZn83Y4MlQTViGDfNMKNWuvbJcExdQgohb0hOLdCw9RB7eurSAwWqsuw74Hmv3h+P59NGSxjyWmxuCTy/AFVceCJnaHZjyv+DgHjh+zzr8+4kNgedoMRb7j/HJpS8obnw=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR17MB6687.namprd17.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(38070700021)(10067099003)(5023799004)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?KNSPcZeNtPsrs6Jp3iKl04Pd/q5v8WR3WDhKsnhTUl/yhq+YppTRjTtflZ?=
 =?iso-8859-1?Q?IIxZNpGboWDPOmaRJDUXAkvTkPDTzskT7b0vilddPYJyi7OMymjekrYtHK?=
 =?iso-8859-1?Q?hEVEjSKTMNQjF0ouamz9sNdfZob1ykSHyTeHMNjmAuq5c3qmMv1G0iG7Td?=
 =?iso-8859-1?Q?p+TYxxvP1qYR/Xv4/WXTHcb+8AqbgbxDWByH1EAZFlfxTMJu6urzBnmLyw?=
 =?iso-8859-1?Q?ANVNIzIxfhCUuBXsiwh1NvLxbo1OcQUTt/RIYHT5N+G+p4mnIaSCGAYp4k?=
 =?iso-8859-1?Q?tiWoiimguTWrHXF8KDQZLJidaIaSCu8q+fOCUgvxU9tC2+Qh5wyU8NC5sX?=
 =?iso-8859-1?Q?KvrtT+p6GOISBf36O1iJOsVXdgQ+B7BrbvLOa+rUKn32HNuotyrG6IBns6?=
 =?iso-8859-1?Q?rMsLLQnXEqK0I1DtPqfQxuGAnBsex+UkSLsUNn+k3H8ed4NkATxyin3eiQ?=
 =?iso-8859-1?Q?+cNlJzvrQrwKpRrt95l2aEC1yOOry6CwmibmRYAnOgIE8F4125y1wH627n?=
 =?iso-8859-1?Q?gZ1EbFbvCWjAzB+HVUEqpUV4lNbQYbauh5uOaxvSWzB2yAZUuf6p4TFI8k?=
 =?iso-8859-1?Q?76gMtTu2C8XS3yAQQkxfBBVol5FQBqB/c3rIffxkyglvZGi89t7LButJTt?=
 =?iso-8859-1?Q?OCf0sYVs1Tb/ORaRaLL0rB+HZ16wKGpmbPxYf5yD4hhzdm1NuET/od/A4M?=
 =?iso-8859-1?Q?Ey++99zdFUpvqwLZLP9FlgwS7BkwGfl2UW8gd2rd6PK1OSI8bKce5QnAnz?=
 =?iso-8859-1?Q?DPVpo5F0GdedpEtV7Uauy8jEI1BtEMn2daj0TFAIqiAKjDtgVUzeBfMlvw?=
 =?iso-8859-1?Q?c3pIuLwhveCSO+FUTuECgTRCqgoIeNlfFD0XnL1/My+6mPPDkGCCIYKMfh?=
 =?iso-8859-1?Q?2oICWRY5tDVRpOdOSkRBgra/+HrKQrzmUGcQJpEEF9TfJ0h77PrUuAoZc+?=
 =?iso-8859-1?Q?VTPOjG9e7HLZtoT/chwqZIOwRPf7bq4Qbq449itfcdf/g0zziZ7kX/nksO?=
 =?iso-8859-1?Q?5BI/JWTIGE07I7XxaeWAQhf/lGdSPdnBj6atkmuJc+qI1UGMILga9UctBn?=
 =?iso-8859-1?Q?6JQC4M8CrTQcjG0NPV6fqE3QhJbdTXJADw+hNVnzis9seMYe0XEDhXOiA3?=
 =?iso-8859-1?Q?dRgK6CbHbr1/q4zSeaP9p+H3JoqaTwTP9Q1w8R/8hKe36kwVe0vIK6fkF9?=
 =?iso-8859-1?Q?1nf9YGwtTVOPsj1WDLZ6KeIeq3Yha9xsUdCI60olRI+eMKsWqjKf0lTCel?=
 =?iso-8859-1?Q?Ljx0/orif5PyQGIzt9LveKLrVccGOD4cuTZf5d7hjLcNBnk2GYJ0Sn1PTJ?=
 =?iso-8859-1?Q?LjLaBmz8JRMg7F0mDsqylj9RMyw9r8J3s4FdkkMPoOBw15gfAQZmkQw4ec?=
 =?iso-8859-1?Q?sJJziiZm1K1+wlY6DW87m9sSW9s5SeIcwK2xqn4wWEpJ6WhM9M1mjFWjf3?=
 =?iso-8859-1?Q?mpdVd4At6PA/n4GBBkkY76saBMbbofoKIGK1/SZhBnmUYJJH7ltTooA3Gc?=
 =?iso-8859-1?Q?WRblBzStjYMoZ7sCtmS6B8zH51BhsOYo2RST3nE99RJmTrIY3h6FxFHcU9?=
 =?iso-8859-1?Q?ayEymRIU7n8AiNX4bq2lMHXDEVRyHTDnRl9o9oyuny4SP/kRz3o6AJOskX?=
 =?iso-8859-1?Q?/NKVQz121F5DFFraE0lKbH2npfio0VxPL8vY3AqbqTJuCApMdT/aqPmy9r?=
 =?iso-8859-1?Q?aA5jCPABGHOaBdac2UfaVMFFAZzMKfLY/8c0QK8pIc0+vIEuk0DcLWzdBv?=
 =?iso-8859-1?Q?9RWiQ6proREqxm2TkE26WJgRNkLkomTzSMz4+y79YLgTv7?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: netinsight.net
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR17MB6687.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ed90e3-1023-47d9-c42d-08df463b3ec9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2026 12:47:17.9910
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f391105a-ad19-4c18-8bce-b08c4b953855
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bdcVZd1cBHu04ZqlnIjqKNo8BZzzbHIL/7T2iui3MglftPHW1swNxg6QUnTfyhZcGT6QO75dNQa92hIO4A8pOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR17MB7598

The driver has no .shutdown hook, so on reboot, power off or kexec the=0A=
chip is left running after device_shutdown(): it keeps receiving=0A=
packets into its RX rings by DMA and raising its interrupt.=0A=
=0A=
Since commit 38f34dba806a ("PM: ACPI: reboot: Reinstate S5 for=0A=
reboot"), the ACPI S5 preparation (_PTS(5), wakeup devices, all GPEs=0A=
disabled) also runs on reboot, after device_shutdown(). On a congatec=0A=
conga-EAF board (AMD G-series) with traffic on the velocity port, a=0A=
reboot now and then hangs after=0A=
=0A=
  ACPI: PM: Preparing to enter system sleep state S5=0A=
  reboot: Restarting system=0A=
=0A=
and the board is never reset. Not running the S5 preparation on reboot=0A=
avoids the hang.=0A=
=0A=
Stop the device the same way commit 2ca1c94ce0b6 ("tg3: Disable tg3=0A=
device on system reboot to avoid triggering AER") did for tg3: add a=0A=
PCI .shutdown hook that detaches and closes the interface, which stops=0A=
the chip, masks its interrupts and frees the rings, and then disables=0A=
the PCI device, which turns off bus mastering.=0A=
=0A=
An interface that is down needs nothing more: velocity_close() has=0A=
already stopped it, or it was never opened and probe left the chip in=0A=
D3hot.=0A=
=0A=
Fixes: 38f34dba806a ("PM: ACPI: reboot: Reinstate S5 for reboot")=0A=
Signed-off-by: Roland Waltersson <rolwal@netinsight.net>=0A=
---=0A=
 drivers/net/ethernet/via/via-velocity.c | 27 +++++++++++++++++++++++++=0A=
 1 file changed, 27 insertions(+)=0A=
=0A=
diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet=
/via/via-velocity.c=0A=
index 6d7b6f3b4..3daf7a8dd 100644=0A=
--- a/drivers/net/ethernet/via/via-velocity.c=0A=
+++ b/drivers/net/ethernet/via/via-velocity.c=0A=
@@ -2942,6 +2942,32 @@ static void velocity_pci_remove(struct pci_dev *pdev=
)=0A=
 	pci_disable_device(pdev);=0A=
 }=0A=
 =0A=
+/**=0A=
+ *	velocity_pci_shutdown	-	stop the device on shutdown=0A=
+ *	@pdev: PCI device=0A=
+ *=0A=
+ *	Called on reboot, power off and kexec. Close the interface, which=0A=
+ *	stops the chip and masks its interrupts, and disable the PCI device,=0A=
+ *	which turns off bus mastering. Otherwise the chip keeps receiving=0A=
+ *	packets into its rings by DMA and raising interrupts while the rest=0A=
+ *	of the restart runs.=0A=
+ */=0A=
+static void velocity_pci_shutdown(struct pci_dev *pdev)=0A=
+{=0A=
+	struct net_device *netdev =3D pci_get_drvdata(pdev);=0A=
+=0A=
+	rtnl_lock();=0A=
+=0A=
+	netif_device_detach(netdev);=0A=
+=0A=
+	if (netif_running(netdev))=0A=
+		dev_close(netdev);=0A=
+=0A=
+	rtnl_unlock();=0A=
+=0A=
+	pci_disable_device(pdev);=0A=
+}=0A=
+=0A=
 static int velocity_platform_probe(struct platform_device *pdev)=0A=
 {=0A=
 	const struct velocity_info_tbl *info;=0A=
@@ -3241,6 +3267,7 @@ static struct pci_driver velocity_pci_driver =3D {=0A=
 	.id_table	=3D velocity_pci_id_table,=0A=
 	.probe		=3D velocity_pci_probe,=0A=
 	.remove		=3D velocity_pci_remove,=0A=
+	.shutdown	=3D velocity_pci_shutdown,=0A=
 	.driver =3D {=0A=
 		.pm =3D &velocity_pm_ops,=0A=
 	},=0A=
=0A=
base-commit: a8aeac0b1883206cf72461258e6bfd991589049e=0A=
